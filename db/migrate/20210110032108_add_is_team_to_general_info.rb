class AddIsTeamToGeneralInfo < ActiveRecord::Migration[6.0]
  def change
    add_column :general_infos, :is_team_website, :boolean, null: false, default: false
  end
end
