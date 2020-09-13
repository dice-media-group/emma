class Broadcaster::Outline < ApplicationRecord
    # belongs_to :broadcaster_theme
    belongs_to :broadcaster_theme, class_name: 'Broadcaster::Theme'
end
