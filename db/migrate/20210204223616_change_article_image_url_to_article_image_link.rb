class ChangeArticleImageUrlToArticleImageLink < ActiveRecord::Migration[6.0]
  def change
    rename_column :first_time_entries, :article_image_url, :article_image_link
  end
end
