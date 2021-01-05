class CreateGetInContactContents < ActiveRecord::Migration[6.0]
  def change
    create_table :get_in_contact_contents do |t|
      t.string :first_name
      t.string :last_name
      t.string :youtube_url

      t.timestamps
    end
  end
end
