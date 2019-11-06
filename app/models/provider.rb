class Provider < ApplicationRecord
    has_many :service, dependent: :destroy
end
