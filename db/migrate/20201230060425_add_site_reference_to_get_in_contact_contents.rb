class AddSiteReferenceToGetInContactContents < ActiveRecord::Migration[6.0]
  def change
    add_reference :get_in_contact_contents, :site, null: false, foreign_key: true
  end
end
