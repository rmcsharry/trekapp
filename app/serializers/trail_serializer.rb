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
              :distance_value,
              :distance_unit,
              :distance_type,
              :publish_status,
              :updated_at,
              :notes_count,
              :comments_count

  def distance_type
    return object.distance_type.dasherize
  end

  def publish_status
    return object.publish_status.dasherize
  end

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