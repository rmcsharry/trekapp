class PersonSerializer < ActiveModel::Serializer
  attributes :id, :avatar_url, :first_name, :last_name, :email, :phone

  has_one :address
end
