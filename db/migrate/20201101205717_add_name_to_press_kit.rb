class AddNameToPressKit < ActiveRecord::Migration[6.0]
  def change
    add_column :press_kits, :name, :string
  end
end
