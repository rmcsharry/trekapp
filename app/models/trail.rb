class Trail < ApplicationRecord
  include ModelHooks

  default_scope { order("updated_at DESC") }

  has_many :notes, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  has_many :assignments, dependent: :destroy
  has_many :people, through: :assignments

  # NOTE: 'loop' is a reserved word, so we set prefix, as we must present it to the outside world as 'loop'
  # (if you create an enum called 'loop' without the prefix you will override Trail.loop default method)
  # NOTE: if addding _ items, they need to be dasherized in the serializer
  enum layout_type: [:undefined, :loop, :out_and_back, :point_to_point], _prefix: true
  enum publish_status: [:draft, :published]
  enum difficulty_level: [:undefined, :easy, :moderate, :difficult]

  def capitalizable_attrs
    ["name"]
  end
end
