class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.string :address
      t.integer :cnpj
      t.string :website
      t.string :linkedin

      t.timestamps
    end
  end
end
