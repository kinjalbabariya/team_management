# frozen_string_literal: true

class Member < ApplicationRecord
  has_many :team_members
  has_many :teams, through: :team_members, dependent: :destroy
  has_many :shifts, dependent: :destroy
  belongs_to :user
end
