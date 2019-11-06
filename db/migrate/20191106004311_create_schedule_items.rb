class CreateScheduleItems < ActiveRecord::Migration[5.0]
  def change
    create_table :schedule_items do |t|
      t.text :description
      t.text :option
      t.text :time
      t.references :schedule, foreign_key: true

      t.timestamps
    end
  end
end
