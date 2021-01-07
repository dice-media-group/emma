class CreateGeneralInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :general_infos do |t|
      t.string :site_name
      t.string :text_number
      t.belongs_to :site, null: false, foreign_key: true

      t.timestamps
    end
  end
end
