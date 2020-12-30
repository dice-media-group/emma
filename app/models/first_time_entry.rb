class FirstTimeEntry < ApplicationRecord
  belongs_to :first_time, dependent: :destroy
end
