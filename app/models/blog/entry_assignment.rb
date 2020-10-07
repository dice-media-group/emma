class Blog::EntryAssignment < ApplicationRecord
  belongs_to :blog_entry, class_name: 'Blog::Entry'

  belongs_to :blog_article, class_name: 'Blog::Article'
end
