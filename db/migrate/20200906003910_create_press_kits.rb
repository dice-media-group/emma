class CreatePressKits < ActiveRecord::Migration[6.0]
  def change
    create_table :press_kits do |t|

      t.timestamps
    end
  end
end
