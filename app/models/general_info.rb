class GeneralInfo < ApplicationRecord
  # default image for meta-tag
  has_one_attached    :meta_image

  acts_as_taggable_on :tags
  acts_as_taggable_on :skills, :interests #You can also configure multiple tag types per model

  belongs_to :site
end
