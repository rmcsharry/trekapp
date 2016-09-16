class AssignmentSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :employee
  belongs_to :trail
end
