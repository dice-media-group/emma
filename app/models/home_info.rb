class HomeInfo < ApplicationRecord
  belongs_to :site, dependent: :destroy
end
