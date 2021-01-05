class HireMe < ApplicationRecord
  belongs_to :site, dependent: :destroy
  has_rich_text :rt_body

end
