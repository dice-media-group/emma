class Biography < ApplicationRecord
    has_rich_text :body
    belongs_to :site
end
