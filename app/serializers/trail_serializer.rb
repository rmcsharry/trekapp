class TrailSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :province, :country_code, :region_type, :agency, :website, :distance_value, :distance_unit
end