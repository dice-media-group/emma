class Blog::Article < ApplicationRecord
  WORDS_PER_MINUTE = 150
  belongs_to    :user
  has_rich_text :body


  has_one   :entry, 
            class_name:   "Blog::Entry",
            foreign_key:  "article_id",
            inverse_of:   :article,
            dependent: :destroy

  accepts_nested_attributes_for :entry,
    :allow_destroy => true,
    :reject_if     => :all_blank
  
  ##########################
  # => Methods
  ##########################
  def reading_time
    # https://alexanderpaterson.com/posts/showing-estimated-reading-time-on-a-rails-blog-post
    words_per_minute = 150
    text =  self.body.to_plain_text
    result = (text.scan(/\w+/).length / WORDS_PER_MINUTE).to_i ||= 1
  end

  def self.collect_pinned
    where("pinned_value > ?", 0)
  end


end
