class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :avatar_url
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      
      t.integer :status, default: 0, null: false # used for enum

      t.timestamps
    end
  end
end
