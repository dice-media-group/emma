class PressKit < ApplicationRecord
    has_many :press_kit_photos
    has_many :press_kit_entries
end
