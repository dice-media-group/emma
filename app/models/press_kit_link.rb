class PressKitLink < ApplicationRecord
  belongs_to :press_kit, dependent: :destroy

      # connect to blog_articles
  scope :social,     -> { where("category = ?", "Social"||"social")}
  scope :website,     -> { where("category = ?", "Website"||"website")}
  scope :company,     -> { where("category = ?", "Company"||"company")}

end
