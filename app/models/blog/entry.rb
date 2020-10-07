class Blog::Entry < ApplicationRecord
  has_many            :blog_entry_assignments, 
                      foreign_key: "blog_entry_id", 
                      class_name: "Blog::EntryAssignment"

  has_many            :blog_articles, 
                      :through => :blog_entry_assignments, 
                      :source => :blog_article                      

  
  has_many            :blog_video_embeds
  has_one_attached    :image # hero image for entry
  
  extend FriendlyId
  friendly_id :title, use: :slugged

  def self.all_pinned
    Blog::Entry.where("pinned_value > ?", 0)
    # "helow"
  end
end
