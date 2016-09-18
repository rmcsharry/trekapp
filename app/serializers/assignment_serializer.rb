class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :status

  belongs_to :person
  belongs_to :trail
end
