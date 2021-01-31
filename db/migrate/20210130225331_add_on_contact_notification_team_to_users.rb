class AddOnContactNotificationTeamToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :on_contact_notification_team, :boolean
  end
end
