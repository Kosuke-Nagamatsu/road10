class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :railway
      t.string :name
      t.string :walking_time
      t.references :building, foreign_key: true
      t.timestamps
    end
  end
end
