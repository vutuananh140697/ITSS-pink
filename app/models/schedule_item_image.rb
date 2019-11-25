class ScheduleItemImage < ApplicationRecord
    mount_uploader :link ,Im
    belongs_to :schedule_item
end
