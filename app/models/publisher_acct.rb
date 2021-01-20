class PublisherAcct < ApplicationRecord
    def self.link(account_name)
        url = self.find_by(name: account_name).url
    end

    def self.all_links_and_icons
        accounts = PublisherAcct.where("linked_icon_for_footer = ?", true)
            .order(:frontpage_ranking)
            .select(:name, :url, :font_awesome_class, :network_kind, :blurb)
    end

    def self.frontpage_icons
        accounts = self.where("frontpage_ranking > ?", 0)
            .order(:frontpage_ranking)
            .select(:name, :url, :font_awesome_class, :network_kind, :blurb)
    end

    def self.sidebar_icons
        accounts = self.where("sidebar_ranking > ?", 0)
            .order(:sidebar_ranking).
            select(:name, :url, :font_awesome_class, :network_kind)
    end

    def self.footer_icons
        accounts = self.where("footer_ranking > ?", 0)
            .order(:footer_ranking)
    end

    def self.linked_icons_for_footer
        accounts = self.footer_icons
            .select(:name, :url, :font_awesome_class, :network_kind, :blurb)
    end

end
