class PressKitPhoto < ApplicationRecord
  belongs_to :press_kit

    # connect to blog_articles
  scope :published_headshots,     -> { where("headshot_or_other = ?", "headshot").where("publish_at <= ?", Time.now)}
  scope :published_action_shots,  -> { where("headshot_or_other != ?", "headshot").where("publish_at <= ?", Time.now)}
  

end
