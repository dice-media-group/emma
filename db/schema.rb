# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_07_081734) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "announcements", force: :cascade do |t|
    t.datetime "published_at"
    t.string "announcement_type"
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "biographies", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "header_photo_url"
    t.bigint "site_id", null: false
    t.index ["site_id"], name: "index_biographies_on_site_id"
  end

  create_table "blog_articles", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "pinned_value", default: 0
    t.bigint "entry_id", null: false
    t.index ["entry_id"], name: "index_blog_articles_on_entry_id"
    t.index ["user_id"], name: "index_blog_articles_on_user_id"
  end

  create_table "blog_entries", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.integer "pinned_value"
    t.datetime "publish_at"
    t.index ["slug"], name: "index_blog_entries_on_slug", unique: true
  end

  create_table "blog_entry_assignments", force: :cascade do |t|
    t.bigint "blog_entry_id", null: false
    t.bigint "blog_article_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["blog_article_id"], name: "index_blog_entry_assignments_on_blog_article_id"
    t.index ["blog_entry_id"], name: "index_blog_entry_assignments_on_blog_entry_id"
  end

  create_table "blog_recommendations", force: :cascade do |t|
    t.bigint "entry_id", null: false
    t.bigint "recommended_entry_id", null: false
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["entry_id"], name: "index_blog_recommendations_on_entry_id"
    t.index ["recommended_entry_id"], name: "index_blog_recommendations_on_recommended_entry_id"
  end

  create_table "blog_video_embeds", force: :cascade do |t|
    t.text "embed_code"
    t.bigint "blog_entry_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["blog_entry_id"], name: "index_blog_video_embeds_on_blog_entry_id"
  end

  create_table "book_infos", force: :cascade do |t|
    t.string "billboard_image_title"
    t.text "billboard_image_url"
    t.bigint "site_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["site_id"], name: "index_book_infos_on_site_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "byline"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "jacket_location"
  end

  create_table "broadcaster_audios", force: :cascade do |t|
    t.string "title"
    t.bigint "broadcaster_theme_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["broadcaster_theme_id"], name: "index_broadcaster_audios_on_broadcaster_theme_id"
  end

  create_table "broadcaster_avatars", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "broadcaster_outlines", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "broadcaster_theme_id", null: false
    t.index ["broadcaster_theme_id"], name: "index_broadcaster_outlines_on_broadcaster_theme_id"
  end

  create_table "broadcaster_social_entries", force: :cascade do |t|
    t.string "title"
    t.bigint "broadcaster_theme_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["broadcaster_theme_id"], name: "index_broadcaster_social_entries_on_broadcaster_theme_id"
  end

  create_table "broadcaster_theme_avatars", force: :cascade do |t|
    t.bigint "broadcaster_theme_id", null: false
    t.bigint "broadcaster_avatar_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["broadcaster_avatar_id"], name: "index_broadcaster_theme_avatars_on_broadcaster_avatar_id"
    t.index ["broadcaster_theme_id"], name: "index_broadcaster_theme_avatars_on_broadcaster_theme_id"
  end

  create_table "broadcaster_themes", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "broadcaster_videos", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "broadcaster_theme_id", null: false
    t.index ["broadcaster_theme_id"], name: "index_broadcaster_videos_on_broadcaster_theme_id"
  end

  create_table "first_time_entries", force: :cascade do |t|
    t.string "title"
    t.text "article_link"
    t.text "article_image_url"
    t.datetime "release_at"
    t.bigint "first_time_id", null: false
    t.date "published_on"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["first_time_id"], name: "index_first_time_entries_on_first_time_id"
  end

  create_table "first_times", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "blurb"
    t.string "twitter_handle"
    t.text "featured_image_src"
    t.text "featured_youtube_video_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "site_id", null: false
    t.index ["site_id"], name: "index_first_times_on_site_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "get_in_contact_contents", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "youtube_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "site_id", null: false
    t.index ["site_id"], name: "index_get_in_contact_contents_on_site_id"
  end

  create_table "hire_mes", force: :cascade do |t|
    t.text "billboard_image_filename"
    t.string "headline"
    t.string "body"
    t.bigint "site_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "learn_more_text"
    t.text "learn_more_pdf_link"
    t.index ["site_id"], name: "index_hire_mes_on_site_id"
  end

  create_table "home_infos", force: :cascade do |t|
    t.text "biography_blurb"
    t.text "video_billboard_url"
    t.text "watch_this_video_url"
    t.bigint "site_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "bio_link_text"
    t.text "watch_this_poster_url"
    t.index ["site_id"], name: "index_home_infos_on_site_id"
  end

  create_table "leads", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email_address"
    t.string "subject"
    t.text "message_body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "media_appearances", force: :cascade do |t|
    t.string "title"
    t.datetime "published_on"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "meetup_infos", force: :cascade do |t|
    t.string "billboard_image_title"
    t.text "billboard_image_url"
    t.bigint "site_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["site_id"], name: "index_meetup_infos_on_site_id"
  end

  create_table "meetups", force: :cascade do |t|
    t.string "title"
    t.date "start_date"
    t.date "end_date"
    t.text "more_info_url"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "merchandise_links", force: :cascade do |t|
    t.string "seller_name"
    t.text "url"
    t.bigint "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_merchandise_links_on_book_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "recipient_type", null: false
    t.bigint "recipient_id", null: false
    t.string "type", null: false
    t.jsonb "params"
    t.datetime "read_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipient_type", "recipient_id"], name: "index_notifications_on_recipient_type_and_recipient_id"
  end

  create_table "photos", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "podcasts", force: :cascade do |t|
    t.text "billboard_image_url"
    t.string "headline"
    t.string "title"
    t.text "podcast_player_src"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "site_id", null: false
    t.index ["site_id"], name: "index_podcasts_on_site_id"
  end

  create_table "press_kit_entries", force: :cascade do |t|
    t.string "title"
    t.text "article_link"
    t.text "article_image_url"
    t.datetime "release_at"
    t.bigint "press_kit_id", null: false
    t.date "published_on"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["press_kit_id"], name: "index_press_kit_entries_on_press_kit_id"
  end

  create_table "press_kit_links", force: :cascade do |t|
    t.string "text"
    t.string "url"
    t.string "category"
    t.bigint "press_kit_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["press_kit_id"], name: "index_press_kit_links_on_press_kit_id"
  end

  create_table "press_kit_photos", force: :cascade do |t|
    t.string "title"
    t.string "byline"
    t.text "description"
    t.string "dimensions_wxh"
    t.bigint "press_kit_id", null: false
    t.string "headshot_or_other"
    t.text "link"
    t.datetime "publish_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["press_kit_id"], name: "index_press_kit_photos_on_press_kit_id"
  end

  create_table "press_kits", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.date "birth_date"
    t.string "birthplace"
    t.bigint "site_id", null: false
    t.index ["site_id"], name: "index_press_kits_on_site_id"
  end

  create_table "publisher_accts", force: :cascade do |t|
    t.string "name"
    t.text "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "font_awesome_class"
    t.string "network_kind"
    t.string "blurb"
  end

  create_table "services", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "provider"
    t.string "uid"
    t.string "access_token"
    t.string "access_token_secret"
    t.string "refresh_token"
    t.datetime "expires_at"
    t.text "auth"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "sites", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.datetime "announcements_last_read_at"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "twitter_handle"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wallpapers", force: :cascade do |t|
    t.string "title"
    t.string "device_size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "biographies", "sites"
  add_foreign_key "blog_articles", "blog_entries", column: "entry_id"
  add_foreign_key "blog_articles", "users"
  add_foreign_key "blog_entry_assignments", "blog_articles"
  add_foreign_key "blog_entry_assignments", "blog_entries"
  add_foreign_key "blog_recommendations", "blog_entries", column: "entry_id"
  add_foreign_key "blog_recommendations", "blog_entries", column: "recommended_entry_id"
  add_foreign_key "blog_video_embeds", "blog_entries"
  add_foreign_key "book_infos", "sites"
  add_foreign_key "broadcaster_audios", "broadcaster_themes"
  add_foreign_key "broadcaster_outlines", "broadcaster_themes"
  add_foreign_key "broadcaster_social_entries", "broadcaster_themes"
  add_foreign_key "broadcaster_theme_avatars", "broadcaster_avatars"
  add_foreign_key "broadcaster_theme_avatars", "broadcaster_themes"
  add_foreign_key "broadcaster_videos", "broadcaster_themes"
  add_foreign_key "first_time_entries", "first_times"
  add_foreign_key "first_times", "sites"
  add_foreign_key "get_in_contact_contents", "sites"
  add_foreign_key "hire_mes", "sites"
  add_foreign_key "home_infos", "sites"
  add_foreign_key "meetup_infos", "sites"
  add_foreign_key "merchandise_links", "books"
  add_foreign_key "podcasts", "sites"
  add_foreign_key "press_kit_entries", "press_kits"
  add_foreign_key "press_kit_links", "press_kits"
  add_foreign_key "press_kit_photos", "press_kits"
  add_foreign_key "press_kits", "sites"
  add_foreign_key "services", "users"
  add_foreign_key "taggings", "tags"
end
