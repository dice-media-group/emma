class Broadcaster::SocialEntry < ApplicationRecord
  belongs_to :broadcaster_theme, class_name: 'Broadcaster::Theme'

end
