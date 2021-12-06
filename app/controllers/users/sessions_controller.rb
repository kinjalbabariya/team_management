# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  layout 'login'
  # GET /resource/sign_in
  def new
    super
  end
end
