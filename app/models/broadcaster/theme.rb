class Broadcaster::Theme < ApplicationRecord
    # has_many :broadcaster_outlines
    has_many :broadcaster_outlines, class_name: 'Broadcaster::Outline'
end

