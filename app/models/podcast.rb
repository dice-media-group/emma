class Podcast < ApplicationRecord
    belongs_to :site, dependent: :destroy
    has_rich_text   :body

end
