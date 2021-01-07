# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# initialize PublisherAcct w/o possible duplication
  publisher_accts = PublisherAcct.create_or_find_by([{ name: 'instagram', url: "http://instagram.com", 
      font_awesome_class: "fab fa-instagram", network_kind: "social", 
      blurb: "Get a glimpse of some of my funnier moments on TikTok" },

    { name: 'youtube', url: "http://youtube.com", 
      font_awesome_class: "fab fa-youtube", network_kind: "social", 
      blurb: "Get a glimpse of some of my funnier moments on TikTok" },

    { name: 'facebook', url: "http://facebook.com", 
      font_awesome_class: "fab fa-facebook-f", network_kind: "social", 
      blurb: "Get a glimpse of some of my funnier moments on facebook" },

    { name: 'twitter', url: "http://twitter.com", 
      font_awesome_class: "fab fa-twitter", network_kind: "social", 
      blurb: "Get a glimpse of some of my funnier moments on TikTok" },

    { name: 'snapchat', url: "http://snapchat.com", 
      font_awesome_class: "fab fa-snapchat-ghost", network_kind: "social", 
      blurb: "An inside look at my life through stories." },

    { name: 'linkedin', url: "http://linkedin.com", 
      font_awesome_class: "fab fa-linkedin", network_kind: "social", 
      blurb: "Get a glimpse of some of my funnier moments on TikTok" },

    {name: "tiktok", url: "http://tiktok.com", 
      font_awesome_class: "fas fa-music", network_kind: "social", 
      blurb: "Get a glimpse of some of my funnier moments on TikTok"},

    {name: "podcast", url: "/podcast", 
      font_awesome_class: "fas fa-podcast", network_kind: "social", 
      blurb: "Perfect for your commute. Listen daily to keynotes, interviews, rants, business meetings, and more."},

    { name: 'stitcher', url: "http://tiktok.com", 
      font_awesome_class: "fas fa-music", network_kind: "podcast", 
      blurb: "Get a glimpse of some of my funnier moments on TikTok" },

    { name: 'soundcloud', url: "http://tiktok.com", 
      font_awesome_class: "fas fa-music", network_kind: "podcast", 
      blurb: "Get a glimpse of some of my funnier moments on TikTok" },

    { name: 'spotify', url: "http://tiktok.com", 
      font_awesome_class: "fas fa-music", network_kind: "podcast", 
      blurb: "Get a glimpse of some of my funnier moments on TikTok" },

    { name: 'castbox', url: "http://tiktok.com", 
      font_awesome_class: "fas fa-music", network_kind: "podcast", 
      blurb: "Get a glimpse of some of my funnier moments on TikTok" },

    { name: 'apple-podcasts', url: "http://tiktok.com", 
      font_awesome_class: "fas fa-music", network_kind: "podcast", 
      blurb: "Get a glimpse of some of my funnier moments on TikTok" },

    { name: 'overcast', url: "http://tiktok.com", 
      font_awesome_class: "fas fa-music", network_kind: "podcast", 
      blurb: "Get a glimpse of some of my funnier moments on TikTok" },

    { name: 'iheart', url: "http://tiktok.com", 
      font_awesome_class: "fas fa-music", network_kind: "podcast", 
      blurb: "Get a glimpse of some of my funnier moments on TikTok" },

    { name: 'tunein', url: "http://tiktok.com", 
      font_awesome_class: "fas fa-music", network_kind: "podcast", 
      blurb: "Get a glimpse of some of my funnier moments on TikTok" },

    { name: 'acast', url: "http://tiktok.com", 
      font_awesome_class: "fas fa-music", network_kind: "podcast", 
      blurb: "Get a glimpse of some of my funnier moments on TikTok" },

    { name: 'google-podcasts', url: "http://tiktok.com", 
      font_awesome_class: "fas fa-music", network_kind: "podcast", 
      blurb: "Get a glimpse of some of my funnier moments on TikTok" },
      
    { name: 'google-podcasts', url: "http://tiktok.com", 
      font_awesome_class: "fas fa-music", network_kind: "podcast", 
      blurb: "Get a glimpse of some of my funnier moments on TikTok" }
    
    ])
# set up site and dependents
@site = Site.first_or_create

@bio  = Biography.first_or_create!(title: "my title", 
                                    header_photo_url:"https://image.freepik.com/free-vector/happy-new-year-2021-blue-geometric-banner-design_1055-9725.jpg", 
                                    site: @site)

@first_time = FirstTime.first_or_create!(first_name: "first name", 
                                          last_name: "last_name", 
                                          blurb: "blurb", 
                                          twitter_handle: "@handle", 
                                          featured_image_src: "https://4.bp.blogspot.com/-uzWg-6Gdekw/WbFva2ldcvI/AAAAAAABOBI/IKII8WoG_AYAAZMJumu_H8I88kr3jRuGgCLcBGAs/s640/southworth-beauty.jpg", 
                                          featured_youtube_video_url:"https://www.youtube.com/embed/z5tugxy70MY", 
                                          site: @site)

@get_in_contact = GetInContactContent.first_or_create!(first_name: "first_name", 
                                                        last_name: "last_name", 
                                                        youtube_url: "https://www.youtube.com/embed/z5tugxy70MY", 
                                                        site: @site)

@hire_me = HireMe.first_or_create!(billboard_image_filename: "billboard_image_filename", 
                                    headline: "string", 
                                    site: @site)

@home_info = HomeInfo.first_or_create!(bio_link_text: "default text for bio_link_text",
                                        biography_blurb: "biography_blurb", 
                                        bio_link_text: "bio link text",
                                        video_billboard_url: "https://cdn.plyr.io/static/demo/View_From_A_Blue_Moon_Trailer-576p.mp4", 
                                        watch_this_video_url: "https://www.youtube.com/embed/z5tugxy70MY", 
                                        watch_this_poster_url: "https://via.placeholder.com/1024x576?text=Watch+This", 
                                        site: @site)

@podcast = Podcast.first_or_create!(billboard_image_url: "https://via.placeholder.com/1425x356?text=Billboard+Poster", 
                                      headline: "billboard image headline", 
                                      title: "Podcast page title", 
                                      podcast_player_src: "podcast_player_src", 
                                      site: @site)
  
@press_kit = PressKit.first_or_create!( name: "name", 
                                        birth_date: Date.new, 
                                        birthplace: "birthplace", 
                                        site: @site)


                                        => #<Podcast id: nil, billboard_image_url: nil, headline: nil, title: nil, podcast_player_src: nil, created_at: nil, updated_at: nil, site_id: nil>#