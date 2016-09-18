class PersonSerializer < ActiveModel::Serializer
  attributes :id, :avatar_url, :first_name, :last_name, :email, :phone

  has_one :address

  # has_many :assignments
  # has_many :trails, through: :assignments  
end
