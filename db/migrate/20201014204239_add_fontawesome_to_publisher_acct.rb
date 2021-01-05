class AddFontawesomeToPublisherAcct < ActiveRecord::Migration[6.0]
  def change
    add_column :publisher_accts, :font_awesome_class, :string
  end
end
