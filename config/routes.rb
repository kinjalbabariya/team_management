# frozen_string_literal: true

Rails.application.routes.draw do
  root 'teams#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions', passwords: 'users/passwords', registrations: 'users/registrations'
  }
  resources :teams
  resources :members
  resources :shifts do
  	post 'save_member_shift'
    collection do
    	get 'create_member_shift'
    end
  end
 
end
