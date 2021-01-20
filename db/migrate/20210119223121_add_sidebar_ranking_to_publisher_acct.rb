class AddSidebarRankingToPublisherAcct < ActiveRecord::Migration[6.0]
  def change
    add_column :publisher_accts, :sidebar_ranking, :integer, null: false, default: 0
  end
end
