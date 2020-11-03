class AddBirthplaceToPressKit < ActiveRecord::Migration[6.0]
  def change
    add_column :press_kits, :birthplace, :string
  end
end
