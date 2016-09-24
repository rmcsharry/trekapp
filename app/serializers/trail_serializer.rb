class TrailSerializer < ActiveModel::Serializer

  attributes  :id,
              :name,
              :gpx_file_url,
              :map_thumbnail_url,
              :elevation_thumbnail_url,
              :province,
              :country_code,
              :region_type,
              :agency,
              :website_url,
              :distance,
              :layout_type,
              :difficulty_level,
              :publish_status,
              :updated_at

  has_many :assignments

  def updated_at
    object.updated_at.to_date
  end
  
  def notes_count
    object.notes.count
  end

  def comments_count
    object.comments.count
  end
end