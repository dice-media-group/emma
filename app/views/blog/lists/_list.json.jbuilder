puts "### blog > lists > _list.json.jbuilder"
puts "blog_list id: #{blog_list[:id]} position #{blog_list[:position]} "
json.extract! blog_list, :id, :name, :position, :created_at, :updated_at, :cards
json.url blog_list_url(blog_list, format: :json)
