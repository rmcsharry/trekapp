class Trail < ApplicationRecord
    has_many :notes, dependent: :destroy

    default_scope { order("updated_at DESC") }

    enum distance_type: [:undefined, :looped, :out_and_back, :point_to_point]
    enum publish_status: [:draft, :published]

end
