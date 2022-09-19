class AddIsdeletedToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :isdeleted, :boolean ,default:false
  end
end
