class Blog::Card < ApplicationRecord
  acts_as_list scope: :list

  belongs_to  :list, class_name: 'Blog::List'

  validates   :name, presence: true
end
