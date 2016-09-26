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
              :updated_at,
              :notes_count,
              :comments_count

  has_many :assignments
  has_many :employees, through: :assignments

  def updated_at
    object.updated_at.to_date
  end
  
  # TODO this is not optimal for performance but MAY suffice
  # Note that it will fire two counts for each trail
  # So on the trails index, for 50 trails, 100 count queries will be executed!
  # A better solution might be to make these part of the model (ie persisted data) and each time
  # a note or a comment is added/deleted, the count is updated
  def notes_count
    object.notes.count
  end

  def comments_count
    object.comments.count
  end
end