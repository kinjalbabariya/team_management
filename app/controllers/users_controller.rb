# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @resources = User.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def resource_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :dob,
      :email,
      :mobile_no,
      :password
    )
  end
end
