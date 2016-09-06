class Trail < ApplicationRecord

    default_scope { order("updated_at DESC") }

    enum distance_type: [:undefined, :loop, :out_and_back, :point_to_point]
    enum publish_status: [:unknown, :draft, :published]

end
