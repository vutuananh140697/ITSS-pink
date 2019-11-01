class ServiceBooking < ApplicationRecord
  belongs_to :user
  belongs_to :schedule
  
  def user_name
    self.user.username
  end
  
  def schedule_id
    self.schedule.id
  end
end
