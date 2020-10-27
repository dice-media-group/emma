class Blog::Recommendation < ApplicationRecord
  belongs_to :entry, class_name: 'Blog::Entry',
  inverse_of: :recommendations

end
