class NoteSerializer < ActiveModel::Serializer
  attributes :id, :note_text

  belongs_to :trail
end
