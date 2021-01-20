class AddFrontpageRankToPublisherAcct < ActiveRecord::Migration[6.0]
  def change
    add_column :publisher_accts, :frontpage_ranking, :integer, null: false, default: 0
  end
end
