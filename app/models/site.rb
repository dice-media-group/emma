class Site < ApplicationRecord
    has_one :biography,                 dependent: :destroy
    has_one :first_time,                dependent: :destroy
    has_one :get_in_contact_content,    dependent: :destroy
    has_one :hire_me,                   dependent: :destroy
    has_one :home_info,                 dependent: :destroy
    has_one :podcast,                   dependent: :destroy
    has_one :press_kit,                 dependent: :destroy
end
