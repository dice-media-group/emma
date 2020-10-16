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
      font_awesome_class: "fas fa-tiktok", network_kind: "social", 
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
