class AddDeclinedToJobApplication < ActiveRecord::Migration[6.1]
  def change
    add_column :job_applications, :msg_declined, :text, null: true
  end
end
