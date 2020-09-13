class Broadcaster::Audio < ApplicationRecord
  belongs_to :broadcaster_theme, class_name: 'Broadcaster::Theme'
end
