class CurrentEmployeesSerializer < ActiveModel::Serializer
  attributes :id, :avatar_url, :first_name, :last_name, :status
end
