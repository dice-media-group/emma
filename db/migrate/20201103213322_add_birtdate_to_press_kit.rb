class AddBirtdateToPressKit < ActiveRecord::Migration[6.0]
  def change
    add_column :press_kits, :birth_date, :date
  end
end
