class Trail < ApplicationRecord

    default_scope { order("updated_at DESC") }

    enum distance_type: [:unknown, :loop, :out_and_back, :point_to_point]
end
