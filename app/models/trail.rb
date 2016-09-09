class Trail < ApplicationRecord
  default_scope { order("updated_at DESC") }

  has_many :notes, dependent: :destroy
  has_many :comments, dependent: :destroy

  # Note that 'loop' is a reserved word, so we call the enum looped instead, but must present it to the outside world as 'loop'
  # if you create an enum called 'loop' you will override Trail.loop default method
  enum distance_type: [:undefined, :loop, :out_and_back, :point_to_point], _prefix: true
  enum publish_status: [:draft, :published]

end
