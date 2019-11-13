class AddTimeToServices < ActiveRecord::Migration[5.0]
  def change
    add_column :services, :start_time, :datetime
    add_column :services, :end_time, :datetime
  end
end
