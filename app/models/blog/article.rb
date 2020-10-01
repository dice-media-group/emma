class Blog::Article < ApplicationRecord
  belongs_to    :user
  has_rich_text :body
  has_many      :blog_entry_assignments,
                class_name: 'Blog::EntryAssignment'

  has_many      :blog_entries, 
                through: :blog_entry_assignments,
                source: :entry,
                class_name: 'Blog::Entry'

  def self.collect_pinned
    where("pinned_value > ?", 0)
  end
end


# class Student < ApplicationRecord
#   has_many :admission_application_students, 
#             class_name: 'Admission::ApplicationStudent'
#   has_many :admission_applications, 
#                  through: :admission_application_students, 
#                   source: :application, 
#               class_name: 'Admission::Application'
# end
