class AddApprovedToJobApplication < ActiveRecord::Migration[6.1]
  def change
    add_column :job_applications, :msg_approved, :text, null: true
    add_column :job_applications, :msg_rejected, :text, null: true
    add_column :job_applications, :proposed_compensation, :decimal, null: true
    add_column :job_applications, :date_start, :date, null: true
  end
end
