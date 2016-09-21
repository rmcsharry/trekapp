class CurrentEmployeesSerializer < ActiveModel::Serializer
  attributes :id, :avatar_url, :first_name, :last_name, :status, :status_code

  def status_code
    return Employee.statuses[object.status]
  end
  
end
