class Broadcaster::Avatar < ApplicationRecord
    has_many :broadcaster_theme_avatars, class_name: 'Broadcaster::ThemeAvatar', foreign_key: 'broadcaster_avatar_id', dependent: :destroy

    has_many :broadcaster_themes, class_name: 'Broadcaster::Theme', through: :broadcaster_theme_avatars


end
