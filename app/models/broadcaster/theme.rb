class Broadcaster::Theme < ApplicationRecord
    # has_many :broadcaster_outlines
    has_many :broadcaster_outlines, class_name: 'Broadcaster::Outline', foreign_key: 'broadcaster_theme_id', dependent: :destroy
    # has_many :outlines, dependent: :destroy
    validates :title, presence: true, uniqueness: true
end
