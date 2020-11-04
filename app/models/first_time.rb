class FirstTime < ApplicationRecord
    has_rich_text   :biography
    has_many        :first_time_entries
end
