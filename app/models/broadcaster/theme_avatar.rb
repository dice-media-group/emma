class Broadcaster::ThemeAvatar < ApplicationRecord
  belongs_to :broadcaster_theme, class_name: 'Broadcaster::Theme'
  belongs_to :broadcaster_avatar, class_name: 'Broadcaster::Avatar'
end
