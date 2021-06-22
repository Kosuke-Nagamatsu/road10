class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :rent
      t.string :address
      t.string :age
      t.text :note

      t.timestamps
    end
  end
end
