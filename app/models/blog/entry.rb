class Blog::Entry < ApplicationRecord
  has_many            :blog_entry_assignments,
                      class_name: 'Blog::EntryAssignment'

  has_many            :blog_articles, 
                      through: :blog_entry_assignments,
                      source: :article,
                      class_name: 'Blog::Article'

  
  has_many            :blog_video_embeds
  has_one_attached    :image # hero image for entry
  
  extend FriendlyId
  friendly_id :title, use: :slugged

  def self.all_pinned
    Blog::Article.collect_pinned
    # "helow"
  end

  def self.all_pinned
    Blog::Article.collect_pinned
  end
  
  def self.pinned(id)
    self.all_pinned.find(id)
  end
end
