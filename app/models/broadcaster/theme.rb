class Broadcaster::Theme < ApplicationRecord
    # has_many :broadcaster_outlines
    has_many :broadcaster_outlines, class_name: 'Broadcaster::Outline', foreign_key: 'broadcaster_theme_id', dependent: :destroy
    has_many :broadcaster_videos, class_name: 'Broadcaster::Video', foreign_key: 'broadcaster_theme_id', dependent: :destroy

    validates :title, presence: true, uniqueness: true


end
