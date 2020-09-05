class Blog::Article < ApplicationRecord
  belongs_to :user
  has_rich_text :body

  def self.collect_pinned
    where("pinned_value > ?", 0)
  end
end
