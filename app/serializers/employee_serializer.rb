class EmployeeSerializer < PersonSerializer
  attributes :status, :status_number

  def status
    return object.status.dasherize
  end

  def status_number
    return Employee.statuses[object.status]
  end
end
