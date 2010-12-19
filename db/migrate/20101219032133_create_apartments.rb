class CreateApartments < ActiveRecord::Migration
  def self.up
    create_table :apartments do |t|
      t.string :title
      t.decimal :price
      t.string :bedrooms
      t.string :link
      t.datetime :posted_at

      t.boolean :cats
      t.decimal :cats_deposit
      t.decimal :cats_rent

      t.boolean :parking
      t.decimal :parking_rent
      t.boolean :laundry

      t.text :pros
      t.text :cons
      t.text :other

      t.string :address
      t.string :city_state_zip
      t.string :country
      t.float :latitude
      t.float :longitude

      t.boolean :ignore, :null => false, :default => false

      t.timestamps
    end

    add_index :apartments, :price
    add_index :apartments, :posted_at
    add_index :apartments, [:latitude, :longitude]
    add_index :apartments, :ignore
    add_index :apartments, :link, :unique => true
  end

  def self.down
    drop_table :apartments
  end
end
