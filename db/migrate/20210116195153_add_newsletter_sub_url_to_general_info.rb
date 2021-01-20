class AddNewsletterSubUrlToGeneralInfo < ActiveRecord::Migration[6.0]
  def change
    add_column :general_infos, :newsletter_sub_url, :text
  end
end
