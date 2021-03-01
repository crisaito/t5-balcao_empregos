class AddRoleToRecruiter < ActiveRecord::Migration[6.1]
  def change
    add_column :recruiters, :role, :integer, default: 1
  end
end
