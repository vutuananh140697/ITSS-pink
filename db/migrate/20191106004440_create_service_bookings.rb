class CreateServiceBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :service_bookings do |t|
      t.references :user, foreign_key: true
      t.references :schedule, foreign_key: true

      t.timestamps
    end
  end
end
