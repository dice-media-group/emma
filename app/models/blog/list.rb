class Blog::List < ApplicationRecord
    acts_as_list

    has_many    :cards,
                ->{ order(position: :asc)},
                dependent: :destroy,
                foreign_key: "list_id", 
                class_name: "Blog::Card"#,
                # inverse_of: :card  
    scope :sorted, ->{ order(position: :asc) }

    validates   :name, presence: true                   

end
