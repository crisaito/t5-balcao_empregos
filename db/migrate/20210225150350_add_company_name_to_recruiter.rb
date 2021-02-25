class AddCompanyNameToRecruiter < ActiveRecord::Migration[6.1]
  def change
    add_column :recruiters, :company_name, :string
  end
end
