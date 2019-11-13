class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :string
      t.text :description

      t.timestamps
    end
  end
end
