class Place < ApplicationRecord
    scope :order_by_name, ->(_name){order :name}
    scope :get_places, ->(name){where("name like ?", "%#{name}%")}
end