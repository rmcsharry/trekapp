class AddressSerializer < ActiveModel::Serializer
  attributes :id, :line1, :line2, :city, :province, :postal_code, :country

  belongs_to :person
end
