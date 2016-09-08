class NoteSerializer < ActiveModel::Serializer
  attributes :id, :note_body

  belongs_to :trail
end
