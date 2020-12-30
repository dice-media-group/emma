class FirstTime < ApplicationRecord
    has_rich_text   :biography
    has_many        :first_time_entries
    belongs_to      :site
end
