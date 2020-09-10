class CreateBlogVideoEmbeds < ActiveRecord::Migration[6.0]
  def change
    create_table :blog_video_embeds do |t|
      t.text :embed_code
      t.belongs_to :blog_entry, null: false, foreign_key: true

      t.timestamps
    end
  end
end
