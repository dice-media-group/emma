class PublisherAcct < ApplicationRecord
    def self.link(account_name)
        url = self.find_by(name: account_name).url
    end
end
