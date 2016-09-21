class PersonSerializer < ActiveModel::Serializer
  attributes :id, :avatar_url, :first_name, :last_name, :email, :phone

  has_one :address

  # TODO: not sure if these are needed, comment for now until I can run some tests
  # has_many :assignments
  # has_many :trails, through: :assignments
end
