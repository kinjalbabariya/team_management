class Shift < ApplicationRecord
	attr_accessor :team_id
  belongs_to :member
  after_create :member_shift_set_mail

  def member_shift_set_mail
  	@team= Team.find_by(id: self.team_id) 
  	begin
      ShiftMailer.with(shift: self, team: @team,member: self.member).shift_update.deliver_now
    rescue Exception => e
      puts e
    end 
 	end
end
