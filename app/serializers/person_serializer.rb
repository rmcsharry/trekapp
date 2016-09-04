class PersonSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :status, :status_number

  def status
    return object.status.dasherize
  end

  def status_number
    return Person.statuses[object.status]
  end
end
