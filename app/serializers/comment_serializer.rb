class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment_body
  has_one :trail
end
