class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.references :trail, foreign_key: true
      t.text :note_text

      t.timestamps
    end
  end
end
