class Meetup < ApplicationRecord
    def self.coming_soon
        Meetup.all.order('start_date DESC').limit(5).select(:title, :start_date, :location, :more_info_url)
    end
end
