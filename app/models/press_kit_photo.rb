class PressKitPhoto < ApplicationRecord
  has_one_attached :image
  belongs_to :press_kit

  validates_presence_of :title
  validates_presence_of :headshot_or_other
  validates_presence_of :dimensions_wxh
  validates_presence_of :publish_at
  
  

    # connect to blog_articles
  scope :published_headshots,     -> { where("headshot_or_other = ?", "headshot").where("publish_at <= ?", Time.now)}
  scope :published_action_shots,  -> { where("headshot_or_other != ?", "headshot").where("publish_at <= ?", Time.now)}
  

end
