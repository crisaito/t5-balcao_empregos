class CreateCandidateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :candidate_feedbacks do |t|
      t.text :declined_msg
      t.references :recruiter_feedback, null: false, foreign_key: true

      t.timestamps
    end
  end
end
