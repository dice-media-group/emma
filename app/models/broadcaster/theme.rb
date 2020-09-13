class Broadcaster::Theme < ApplicationRecord
    # has_many :broadcaster_outlines
    has_many :broadcaster_outlines, class_name: 'Broadcaster::Outline', foreign_key: 'broadcaster_theme_id', dependent: :destroy

    has_many :broadcaster_videos, class_name: 'Broadcaster::Video', foreign_key: 'broadcaster_theme_id', dependent: :destroy

    has_many :broadcaster_audios, class_name: 'Broadcaster::Audio', foreign_key: 'broadcaster_theme_id', dependent: :destroy

    has_many :broadcaster_social_entries, class_name: 'Broadcaster::SocialEntry', foreign_key: 'broadcaster_theme_id', dependent: :destroy

    has_many :broadcaster_theme_avatars, class_name: 'Broadcaster::ThemeAvatar', foreign_key: 'broadcaster_theme_id', dependent: :destroy

    has_many :broadcaster_avatars, class_name: 'Broadcaster::Avatar', through: :broadcaster_theme_avatars

    

    validates :title, presence: true, uniqueness: true


end
