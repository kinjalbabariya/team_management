# frozen_string_literal: true

module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    attr_accessor :filtering_params

    def filter(filtering_params, current_ability = nil)
      @filtering_params = filtering_params
      @results = current_ability ? accessible_by(current_ability).where(nil) : where(nil)

      filter_with_date(filtering_params[:date_range_column]) if date_present?
      filtering_params.except(:date_range_column, :start_date, :end_date, :status, :role).each do |key, value|
        next unless value.present?

        @results = if column_type(key) == :string
                     @results.where("lower(#{column(key)}) LIKE ?", "%#{value.downcase}%")
                   else
                     @results.where("#{resource_name}.#{key} = ?", value)
                   end
      end
      @results
    end

    def filter_with_date(d_r_column)
      @results = @results.where("DATE(#{d_r_column}) BETWEEN ? AND ?", start_date.to_date, end_date.to_date)
    end

    private

    def start_date
      filtering_params[:start_date].present? ? filtering_params.fetch(:start_date) : Expense.minimum(:paid_date)
    end

    def end_date
      filtering_params[:end_date].present? ? filtering_params.fetch(:end_date) : Expense.maximum(:paid_date)
    end

    def resource_name
      table_name
    end

    def column(key)
      return key if key.split('.').count > 1

      "#{resource_name}.#{key}"
    end

    def column_type(key)
      columns_hash[key].type
    end

    def date_present?
      filtering_params[:start_date].present? || filtering_params[:end_date].present?
    end
  end
end
