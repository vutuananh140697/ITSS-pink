class AddPlaceToServices < ActiveRecord::Migration[5.0]
  def change
    add_reference :services, :place, foreign_key: true
  end
end
