# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  layout 'login', only: [:new,:create]

  def create
      build_resource(sign_up_params)

      if resource.save!
         yield resource if block_given?
          if resource.persisted?
            if resource.active_for_authentication?
              set_flash_message! :notice, :signed_up
              sign_up(resource_name, resource)
              respond_with resource, location: after_sign_up_path_for(resource)
            else
              set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
              expire_data_after_sign_in!
              respond_with resource, location: after_inactive_sign_up_path_for(resource)
            end
          else
            clean_up_passwords resource
            resource.errors.full_messages.each {|x| flash[x] = x} 
            set_minimum_password_length
            response_to_sign_up_failure resource    
          end
      else
        resource.errors.full_messages.each {|x| flash[x] = x} 
        redirect_to new_registration_path(resource_name)
      end
   
     
  end

  private

  def response_to_sign_up_failure(resource)
    if resource.email == "" && resource.password == nil
      redirect_to root_path
    elsif User.pluck(:email).include? resource.email
      resource.errors.full_messages.each {|x| flash[x] = x} 
      redirect_to new_registration_path(resource_name)
    end
  end 

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :dob, :mobile_no,:email,:password])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
