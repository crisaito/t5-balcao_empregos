class AddTotalApplicationToJob < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :total_application, :integer, default: 0
  end
end
