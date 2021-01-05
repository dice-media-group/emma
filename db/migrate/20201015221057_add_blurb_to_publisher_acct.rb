class AddBlurbToPublisherAcct < ActiveRecord::Migration[6.0]
  def change
    add_column :publisher_accts, :blurb, :string
  end
end
