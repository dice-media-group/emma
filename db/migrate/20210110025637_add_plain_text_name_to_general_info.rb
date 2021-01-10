class AddPlainTextNameToGeneralInfo < ActiveRecord::Migration[6.0]
  def change
    add_column :general_infos, :plain_text_name, :string
  end
end
