class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :status

  belongs_to :employee
  belongs_to :trail
end
