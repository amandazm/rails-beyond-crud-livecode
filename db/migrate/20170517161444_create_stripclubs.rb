class CreateStripclubs < ActiveRecord::Migration[5.0]
  def change
    create_table :stripclubs do |t|
      t.string :name
      t.string :location
      t.integer :female_dancers
      t.integer :male_dancers
      t.string :phone_number
      t.string :music

      t.timestamps
    end
  end
end
