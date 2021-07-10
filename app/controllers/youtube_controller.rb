class YoutubeController < ApplicationController
  # references:
  # Advanced ActionText: Attaching any model in rich text
  # https://stackoverflow.com/questions/61867995/how-to-embed-an-iframe-with-actiontext-trix-on-ruby-on-rails
  # https://railsconf.com/2020/2020/video/chris-oliver-advanced-actiontext-attaching-any-model-in-rich-text
  # source for app that uses it:  https://github.com/excid3/railsconf-2020-actiontext


  def show
    @youtube = Youtube.new(id: params[:id])
    render json: {
      sgid: @youtube.attachable_sgid,
      content: render_to_string(partial: "youtubes/thumbnail", locals: { youtube: @youtube }, formats: [:html])
    }
  end
end
