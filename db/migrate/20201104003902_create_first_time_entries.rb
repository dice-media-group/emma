class CreateFirstTimeEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :first_time_entries do |t|
      t.string :title
      t.text :article_link
      t.text :article_image_url
      t.datetime :release_at
      t.belongs_to :first_time, null: false, foreign_key: true
      t.date :published_on

      t.timestamps
    end
  end
end
