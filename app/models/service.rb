class Service < ApplicationRecord
  belongs_to :provider
  belongs_to :categories
  has_many :service_images, dependent: :destroy
end
