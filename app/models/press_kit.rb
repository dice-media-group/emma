class PressKit < ApplicationRecord
    has_many :press_kit_photos, dependent: :destroy
    has_many :press_kit_entries, dependent: :destroy
    has_many :press_kit_links, dependent: :destroy
    
    belongs_to :site, dependent: :destroy

    has_rich_text :biography


    def calculate_current_age(birth_date = self.birth_date)
        now             = Time.now.utc.to_date
        # https://medium.com/@craigsheen/calculating-age-in-rails-9bb661f11303
        age             = ((Time.zone.now - birth_date.to_time) / 1.year.seconds).floor
        
    end
end
