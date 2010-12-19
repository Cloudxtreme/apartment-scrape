class CreateApartments < ActiveRecord::Migration
  def self.up
    create_table :apartments do |t|
      t.string :title
      t.decimal :price
      t.string :bedrooms
      t.string :address
      t.boolean :cats
      t.decimal :cats_deposit
      t.decimal :cats_rent
      t.boolean :parking
      t.decimal :parking_rent
      t.boolean :laundry
      t.text :pros
      t.text :cons
      t.text :other
      t.string :link
      t.datetime :posted_at

      t.timestamps
    end
  end

  def self.down
    drop_table :apartments
  end
end
