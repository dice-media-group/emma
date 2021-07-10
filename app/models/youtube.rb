class Youtube
  # references:
  # Advanced ActionText: Attaching any model in rich text
  # https://stackoverflow.com/questions/61867995/how-to-embed-an-iframe-with-actiontext-trix-on-ruby-on-rails
  # https://railsconf.com/2020/2020/video/chris-oliver-advanced-actiontext-attaching-any-model-in-rich-text
  # source for app that uses it:  https://github.com/excid3/railsconf-2020-actiontext
  
  include ActiveModel::Model
  include ActiveModel::Attributes
  include GlobalID::Identification
  include ActionText::Attachable

  attribute :id

  def self.find(id)
    new(id: id)
  end

  def thumbnail_url
    "http://i3.ytimg.com/vi/#{id}/maxresdefault.jpg"
  end

  def to_trix_content_attachment_partial_path
    "youtubes/thumbnail"
  end
end
