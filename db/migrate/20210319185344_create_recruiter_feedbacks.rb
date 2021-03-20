class CreateRecruiterFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :recruiter_feedbacks do |t|
      t.text :rejected_msg
      t.text :approved_msg
      t.decimal :proposed_compensation
      t.date :date_start
      t.references :job_application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
