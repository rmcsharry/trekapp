class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.references :person, foreign_key: true
      t.references :trail, foreign_key: true
      t.integer :status, default: 0, null: false # used for enum
      
      t.timestamps
    end
  end
end
