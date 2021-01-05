class CreatePublisherAccts < ActiveRecord::Migration[6.0]
  def change
    create_table :publisher_accts do |t|
      t.string :name
      t.text :url

      t.timestamps
    end
  end
end
