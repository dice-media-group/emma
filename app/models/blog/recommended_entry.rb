class Blog::RecommendedEntry < Blog::Entry
  # 10/27/20: this model can be 
  has_many  :recommendations, 
            foreign_key: "recommended_entry_id", 
            class_name: "Blog::Recommendation"#,
            # inverse_of: :entry
  has_many  :entries, 
            through: :recommendations,
            source: :entry

end