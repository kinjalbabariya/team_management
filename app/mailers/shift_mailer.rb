class ShiftMailer < ApplicationMailer
	default from: 'notifications@example.com'

  def shift_update
    @shift = params[:shift]
    @team  = params[:team]
    @member = params[:member]
    mail(to: "cr_dev@full-cycle.com", subject: 'Shift Time Information')
  end
end
