class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.references :person, foreign_key: true
      t.references :trail, foreign_key: true

      t.timestamps
    end
  end
end
