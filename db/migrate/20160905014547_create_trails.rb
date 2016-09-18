class CreateTrails < ActiveRecord::Migration[5.0]
  def change
    create_table :trails do |t|
      t.string :name
      t.string :gpx_file_url
      t.string :map_thumbnail_url
      t.string :elevation_thumbnail_url
      t.string :province
      t.string :country_code
      t.string :region_type
      t.string :agency
      t.string :website_url      
      t.string :distance_value
      t.string :distance_unit
      t.integer :layout_type, default: 0, null: false # used for enum
      t.integer :publish_status, default: 0, null: false # used for enum
      t.integer :difficulty_level, default: 0, null: false # used for enum

      t.timestamps
    end
  end
end
