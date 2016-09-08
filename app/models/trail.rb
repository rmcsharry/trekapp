class Trail < ApplicationRecord
  has_many :notes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def distance_type=(distance_type)
    write_attribute(:distance_type, safely_in(distance_type))
  end

  def distance_type
    safely_out(read_attribute(:distance_type))
  end

  private
  
  def safely_out(distance_type)
    return "loop" if distance_type == "looped"
    distance_type
  end

  def safely_in(distance_type)
    return "looped" if distance_type == "loop"
    distance_type
  end


  default_scope { order("updated_at DESC") }

  # Note that 'loop' is a reserved word, so we call the enum looped instead, but must present it to the outside world as 'loop'
  # if you create an enum called 'loop' you will override Trail.loop default method
  enum distance_type: [:undefined, :looped, :out_and_back, :point_to_point]
  enum publish_status: [:draft, :published]
end
