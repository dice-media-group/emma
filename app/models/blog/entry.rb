class Blog::Entry < ApplicationRecord
  # connect to blog_articles
  has_many            :blog_entry_assignments, 
                      foreign_key: "blog_entry_id", 
                      class_name: "Blog::EntryAssignment"

  has_many            :blog_articles, 
                      :through => :blog_entry_assignments, 
                      :source => :blog_article                      

  # connect to blog_video_embeds  
  has_many            :blog_video_embeds
  has_one_attached    :image # hero image for entry
  
  # connect to blog_recommendations
  has_many  :recommendations, 
            foreign_key: "entry_id", 
            class_name: "Blog::Recommendation"#,
            # inverse_of: :entry
  accepts_nested_attributes_for :recommendations, 
                                reject_if: :all_blank, 
                                allow_destroy: true

  #connect to recommended_entries
  has_many  :recommended_entries, 
            :through => :recommendations,                 
            :source => :recommended_entry                      



  extend FriendlyId
  friendly_id :title, use: :slugged

  def self.all_pinned
    Blog::Entry.where("pinned_value > ?", 0)
    # "helow"
  end

  def self.from_time
    Time.now - self.created_at
  end
end
