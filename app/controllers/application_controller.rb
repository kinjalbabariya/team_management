# frozen_string_literal: true

module Current
  thread_mattr_accessor :user
end

class ApplicationController < ActionController::Base
  
end
