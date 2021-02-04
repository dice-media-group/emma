class FirstTimeEntry < ApplicationRecord

  validates_presence_of :title
  validates_presence_of :article_link
  validates_presence_of :article_image_link
  validates_presence_of :published_on
  validates_presence_of :release_at
end
