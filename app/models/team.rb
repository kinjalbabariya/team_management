# frozen_string_literal: true

class Team < ApplicationRecord
	has_many :team_members, inverse_of: :team
  has_many :members, through: :team_members, dependent: :destroy
  accepts_nested_attributes_for :team_members, reject_if: :all_blank, allow_destroy: true
  belongs_to :user
end
