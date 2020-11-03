class PressKit < ApplicationRecord
    has_many :press_kit_photos
    has_many :press_kit_entries
    has_many :press_kit_links
    has_rich_text :biography


    def calculate_current_age(birth_date = self.birth_date)
        now             = Time.now.utc.to_date
        # https://medium.com/@craigsheen/calculating-age-in-rails-9bb661f11303
        age             = ((Time.zone.now - birth_date.to_time) / 1.year.seconds).floor
        
    end
end
