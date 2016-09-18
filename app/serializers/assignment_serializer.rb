class AssignmentSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :person
  belongs_to :trail
end
