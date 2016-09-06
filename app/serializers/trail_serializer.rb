class TrailSerializer < ActiveModel::Serializer
  attributes  :id,
              :name,
              :map_thumbnail_url,
              :elevation_thumbnail_url,
              :province,
              :country_code,
              :region_type,
              :agency,
              :website,
              :distance_value,
              :distance_unit,
              :distance_type,
              :publish_status,
              :updated_at    

  def distance_type
    return object.distance_type.dasherize
  end

  def publish_status
    return object.publish_status.dasherize
  end

  def updated_at
    object.updated_at.to_date
  end
end