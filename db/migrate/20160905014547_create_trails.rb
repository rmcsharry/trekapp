class CreateTrails < ActiveRecord::Migration[5.0]
  def change
    create_table :trails do |t|
      t.string :name
      t.string :map_thumbnail_url
      t.string :province
      t.string :country_code
      t.string :region_type
      t.string :agency
      t.string :website
      t.string :distance_value
      t.string :distance_unit
      t.integer :distance_type

      t.timestamps
    end
  end
end
