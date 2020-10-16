# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# initialize PublisherAcct w/o possible duplication
  publisher_accts = PublisherAcct.create_or_find_by([{ name: 'instagram', url: "http://instagram.com", 
      font_awesome_class: "fas fa-music", network_kind: "social", 
      blurb: "Get a glimpse of some of my funnier moments on TikTok" },

    { name: 'youtube', url: "http://tiktok.com", 
      font_awesome_class: "fas fa-music", network_kind: "social", 
      blurb: "Get a glimpse of some of my funnier moments on TikTok" },

    { name: 'facebook', url: "http://tiktok.com", 
      font_awesome_class: "fas fa-music", network_kind: "social", 
      blurb: "Get a glimpse of some of my funnier moments on TikTok" },

    { name: 'twitter', url: "http://tiktok.com", 
      font_awesome_class: "fas fa-music", network_kind: "social", 
      blurb: "Get a glimpse of some of my funnier moments on TikTok" },

    { name: 'snapchat', url: "http://tiktok.com", 
      font_awesome_class: "fas fa-music", network_kind: "social", 
      blurb: "Get a glimpse of some of my funnier moments on TikTok" },

    { name: 'linkedin', url: "http://tiktok.com", 
      font_awesome_class: "fas fa-music", network_kind: "social", 
      blurb: "Get a glimpse of some of my funnier moments on TikTok" },

    {name: "tiktok", url: "http://tiktok.com", 
      font_awesome_class: "fas fa-music", network_kind: "social", 
      blurb: "Get a glimpse of some of my funnier moments on TikTok"},

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
