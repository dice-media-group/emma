class AddSiteReferenceToFirstTime < ActiveRecord::Migration[6.0]
  def change
    add_reference :first_times, :site, null: false, foreign_key: true
  end
end
