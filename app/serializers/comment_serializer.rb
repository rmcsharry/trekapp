class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment_body
  
  belongs_to :trail
end
