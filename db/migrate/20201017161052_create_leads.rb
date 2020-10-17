class CreateLeads < ActiveRecord::Migration[6.0]
  def change
    create_table :leads do |t|
      t.string :name
      t.string :phone
      t.string :email_address
      t.string :subject
      t.text :message_body

      t.timestamps
    end
  end
end
