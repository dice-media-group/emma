class CreateBlogCards < ActiveRecord::Migration[6.0]
  def change
    create_table :blog_cards do |t|
      t.references :list, index: true

      t.string :name
      t.integer :position

      t.timestamps
    end

    add_foreign_key :blog_cards, :blog_lists, column: :list_id
  end
end
