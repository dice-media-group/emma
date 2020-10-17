class AddBookJacketLocationToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :jacket_location, :text
  end
end
