class Blog::Entry < ApplicationRecord
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
