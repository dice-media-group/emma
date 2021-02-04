class FirstTime < ApplicationRecord
    has_rich_text   :biography
    has_many        :first_time_entries, dependent: :destroy
    belongs_to :site, dependent: :destroy
end
