puts "### blog > lists > show"
puts "@list #{@list.name} position #{@list.position} "
json.partial! "blog/lists/list", blog_list: @list
