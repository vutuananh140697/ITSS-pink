class ScheduleItem < ApplicationRecord
  belongs_to :schedule
  has_one :schedule_item_image, dependent: :destroy
end
