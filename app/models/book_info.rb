class BookInfo < ApplicationRecord
  belongs_to :site, dependent: :destroy
end
