class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.integer :employee_id
      t.string  :name
      t.string  :location
      t.timestamps
    end
  end
end
