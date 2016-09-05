class Trail < ApplicationRecord
    enum distance_type: [:unknown, :loop, :out_and_back, :point_to_point]
end
