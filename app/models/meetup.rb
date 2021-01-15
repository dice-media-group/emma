class Meetup < ApplicationRecord
    def self.coming_soon
        where('end_date >= ?',  Date.today).order("start_date ASC").first(5)
    end
end
