# frozen_string_literal: true

module ApplicationHelper
	include Pagy::Frontend
  def current_class?(cnt_name)
    controller_name == cnt_name ? 'active selected' : ''
  end

  def current_company
  	current_user.company
  end

  def previous_path
  	request.referer.present? ? request.referer : root_path
  end
end
