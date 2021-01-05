class AddSiteReferenceToBiography < ActiveRecord::Migration[6.0]
  def change
    add_reference :biographies, :site, null: false, foreign_key: true
  end
end
