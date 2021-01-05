class AddSiteReferenceToPressKit < ActiveRecord::Migration[6.0]
  def change
    add_reference :press_kits, :site, null: false, foreign_key: true
  end
end
