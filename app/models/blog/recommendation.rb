class Blog::Recommendation < ApplicationRecord
  belongs_to :entry, class_name: 'Blog::Entry',
  inverse_of: :recommendations

  # this line says you'll have another foreign key in here called recommended_id, 
  # but it's actually a member of the model Blog::Entry
  belongs_to :recommended_entry, class_name: "Blog::RecommendedEntry",
  inverse_of: :recommendations

  
end
