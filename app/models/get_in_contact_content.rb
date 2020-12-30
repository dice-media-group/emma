class GetInContactContent < ApplicationRecord
    belongs_to :site, dependent: :destroy
    has_rich_text :page_message
end
