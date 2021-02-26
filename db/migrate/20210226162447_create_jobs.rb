class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.decimal :compensation
      t.string :experience_level
      t.string :requirements
      t.date :expiration_date
      t.integer :total_jobs
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
