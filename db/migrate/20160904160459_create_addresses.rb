class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :line3
      t.string :city
      t.string :province
      t.string :postal_code
      t.string :country
      t.integer :addressable_id
      t.string :addressable_type

      t.timestamps
    end

    add_index :addresses, [:addressable_type, :addressable_id], unique: true
  end
end
