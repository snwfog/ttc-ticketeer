class UpdateTicketAddIssueToUserId < ActiveRecord::Migration
  def change
    add_column :tickets, :issue_to_user_id, :integer
  end
end
