class Blog::Card < ApplicationRecord
  has_one_attached    :image # hero image for entry

  acts_as_list scope: :list

  belongs_to  :list, class_name: 'Blog::List'

  validates   :name, presence: true

  def image_url
    if image.attached?
      image_url =  self.image.url
    else
      image_url = "https://via.placeholder.com/425x356?text=missing+image"
    end
      
  end

  def image_blob
    self.image.blob
  end
end
