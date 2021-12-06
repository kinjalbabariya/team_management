# frozen_string_literal: true

class ShiftsController < ApplicationController
  before_action :authenticate_user!
  # GET /shifts
  def index
    if params[:team_id].present?
      member_ids = TeamMember.where(team_id: params[:team_id]).map(&:member_id)
      @shifts =  member_ids.present? ? Member.where(id: member_ids) : []
    else
      @shifts = []
    end    
  end

  def create_member_shift
  end

  def save_member_shift
    if params[:member_id].present?
      (1..7).each do |i|
        if params["start_time_#{i}(4i)"] != "00" || params["start_time_#{i}(5i)"] != "00" || params["end_time_#{i}(4i)"] != "00" || params["end_time_#{i}(5i)"] != "00"
          @shift = Shift.find_or_initialize_by(member_id: params[:member_id],day: i)
          @shift.start_time   = params["start_time_#{i}(4i)"] +":" + params["start_time_#{i}(5i)"]
          @shift.end_time   = params["end_time_#{i}(4i)"] +":" + params["end_time_#{i}(5i)"]
          @shift.team_id    = params[:team_id]
          @shift.save!
        end
      end
    end
    redirect_to shifts_url(team_id: params[:team_id]), notice: 'Member Shift Time set successfully'
  end

end
