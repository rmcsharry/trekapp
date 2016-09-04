class AddressSerializer < ActiveModel::Serializer
  attributes :id, :line1, :line2, :line3, :city, :province, :postal_code, :country, :country_code

  belongs_to :addressable
end
