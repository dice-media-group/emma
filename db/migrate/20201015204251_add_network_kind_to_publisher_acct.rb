class AddNetworkKindToPublisherAcct < ActiveRecord::Migration[6.0]
  def change
    add_column :publisher_accts, :network_kind, :string
  end
end
