class PersonSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :phone

  has_one :address
end
