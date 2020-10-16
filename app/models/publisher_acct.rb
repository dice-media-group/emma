class PublisherAcct < ApplicationRecord
    def self.link(account_name)
        url = self.find_by(name: account_name).url
    end

    def self.all_links_and_icons
        accounts = PublisherAcct.select(:name, :url, :font_awesome_class, :blurb)
    end
end
