class Service < ApplicationRecord
  belongs_to :provider
  belongs_to :category
  has_many :service_images, dependent: :destroy
end
