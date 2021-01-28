class AddPodcastRankingToPublisherAccts < ActiveRecord::Migration[6.0]
  def change
    add_column :publisher_accts, :podcast_ranking, :integer, default: 0, null: false
  end
end
