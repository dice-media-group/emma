class AddSvgLogoStyleToPublisherAcct < ActiveRecord::Migration[6.0]
  def change
    add_column :publisher_accts, :svg_logo_style, :text
  end
end
