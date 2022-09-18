class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :contact_number
      t.integer :role  
      t.references :teamlead, foreign_key: { to_table: :employees } 
      t.string :email
      t.string :password_digest
      t.timestamps
    end
  end
end
