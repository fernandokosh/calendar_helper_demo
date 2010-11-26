# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101116163625) do

  create_table "address_types", :force => true do |t|
    t.string   "name"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "addresses", :force => true do |t|
    t.string   "street"
    t.string   "number"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "area_code",       :limit => 5
    t.string   "telephone",       :limit => 15
    t.string   "name"
    t.integer  "address_type_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "agendas", :force => true do |t|
    t.string   "event"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "country_id"
    t.string   "city"
    t.integer  "state_id"
    t.string   "phone"
    t.string   "email"
    t.string   "website"
    t.text     "information"
    t.boolean  "enabled",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "app_configs", :force => true do |t|
    t.string   "label"
    t.string   "name"
    t.string   "value"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "app_configs", ["name"], :name => "index_app_configs_on_name"

  create_table "audits", :force => true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "changes"
    t.integer  "version",        :default => 0
    t.datetime "created_at"
  end

  add_index "audits", ["auditable_id", "auditable_type"], :name => "auditable_index"
  add_index "audits", ["created_at"], :name => "index_audits_on_created_at"
  add_index "audits", ["user_id", "user_type"], :name => "user_index"

  create_table "carts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts_products", :id => false, :force => true do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "telephone"
    t.string   "email"
    t.string   "subject"
    t.text     "body"
    t.boolean  "read",       :default => false
    t.boolean  "replied",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "content_positions", :force => true do |t|
    t.string   "name"
    t.string   "acronym"
    t.integer  "order"
    t.boolean  "enabled",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "content_positions", ["acronym"], :name => "index_content_positions_on_acronym"
  add_index "content_positions", ["enabled"], :name => "index_content_positions_on_enabled"
  add_index "content_positions", ["order"], :name => "index_content_positions_on_order"

  create_table "contents", :force => true do |t|
    t.string   "type"
    t.integer  "user_id"
    t.string   "name"
    t.text     "body"
    t.boolean  "can_receive_comments",                                     :default => false
    t.boolean  "comments_are_moderated",                                   :default => false
    t.boolean  "published",                                                :default => false
    t.boolean  "enabled",                                                  :default => false
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "char_count",                                               :default => 0,     :null => false
    t.boolean  "delta",                                                    :default => true,  :null => false
    t.integer  "publication_id"
    t.integer  "editorial_position_id"
    t.boolean  "show_image_in_editorial",                                  :default => false
    t.integer  "event_id"
    t.integer  "event_position_id"
    t.boolean  "show_in_event_front",                                      :default => false
    t.boolean  "show_image_in_event_front",                                :default => false
    t.boolean  "include_event_in_ticker",                                  :default => false
    t.boolean  "include_in_newsletter",                                    :default => true
    t.boolean  "show_in_front",                                            :default => false
    t.boolean  "show_image_in_front",                                      :default => false
    t.integer  "front_position_id"
    t.string   "front_title"
    t.string   "front_subtitle"
    t.string   "preliminary_title"
    t.boolean  "skip_permissions_roles",                                   :default => false
    t.boolean  "has_image",                                                :default => false
    t.boolean  "has_flip",                                                 :default => false
    t.integer  "start_in_page"
    t.integer  "end_in_page"
    t.string   "author"
    t.integer  "edition_id"
    t.integer  "media_id"
    t.integer  "product_category_id"
    t.integer  "product_type_id"
    t.integer  "editorials_quantity"
    t.integer  "period"
    t.boolean  "frete"
    t.string   "name_en"
    t.string   "body_en"
    t.string   "aditional_info_en"
    t.integer  "sequencial"
    t.decimal  "price",                     :precision => 14, :scale => 4, :default => 0.0
    t.integer  "product_position_id"
    t.decimal  "international_price",       :precision => 14, :scale => 4, :default => 0.0
    t.text     "aditional_info"
    t.decimal  "weight",                    :precision => 5,  :scale => 3, :default => 0.0
    t.decimal  "width",                     :precision => 5,  :scale => 3, :default => 0.0
    t.decimal  "height",                    :precision => 5,  :scale => 3, :default => 0.0
    t.decimal  "depth",                     :precision => 5,  :scale => 3, :default => 0.0
    t.decimal  "weight_delivery",           :precision => 5,  :scale => 3, :default => 0.0
    t.decimal  "width_delivery",            :precision => 5,  :scale => 3, :default => 0.0
    t.decimal  "height_delivery",           :precision => 5,  :scale => 3, :default => 0.0
    t.decimal  "depth_delivery",            :precision => 5,  :scale => 3, :default => 0.0
  end

  add_index "contents", ["can_receive_comments"], :name => "index_contents_on_can_receive_comments"
  add_index "contents", ["comments_are_moderated"], :name => "index_contents_on_comments_are_moderated"
  add_index "contents", ["edition_id"], :name => "index_contents_on_edition_id"
  add_index "contents", ["editorial_position_id"], :name => "index_contents_on_editorial_position_id"
  add_index "contents", ["enabled"], :name => "index_contents_on_enabled"
  add_index "contents", ["event_id"], :name => "index_contents_on_event_id"
  add_index "contents", ["event_position_id"], :name => "index_contents_on_event_position_id"
  add_index "contents", ["front_position_id"], :name => "index_contents_on_front_position_id"
  add_index "contents", ["has_flip"], :name => "index_contents_on_has_flip"
  add_index "contents", ["include_event_in_ticker"], :name => "index_contents_on_include_event_in_ticker"
  add_index "contents", ["include_in_newsletter"], :name => "index_contents_on_include_in_newsletter"
  add_index "contents", ["price"], :name => "index_contents_on_price"
  add_index "contents", ["product_category_id"], :name => "index_contents_on_product_category_id"
  add_index "contents", ["product_type_id"], :name => "index_contents_on_product_type_id"
  add_index "contents", ["publication_id"], :name => "index_contents_on_publication_id"
  add_index "contents", ["published"], :name => "index_contents_on_published"
  add_index "contents", ["show_image_in_editorial"], :name => "index_contents_on_show_image_in_editorial"
  add_index "contents", ["show_image_in_event_front"], :name => "index_contents_on_show_image_in_event_front"
  add_index "contents", ["show_image_in_front"], :name => "index_contents_on_show_image_in_front"
  add_index "contents", ["show_in_event_front"], :name => "index_contents_on_show_in_event_front"
  add_index "contents", ["show_in_front"], :name => "index_contents_on_show_in_front"
  add_index "contents", ["skip_permissions_roles"], :name => "index_contents_on_skip_permissions_roles"
  add_index "contents", ["type"], :name => "index_contents_on_type"
  add_index "contents", ["user_id"], :name => "index_contents_on_user_id"

  create_table "contents_images", :id => false, :force => true do |t|
    t.integer "content_id"
    t.integer "image_id"
    t.boolean "front_page", :default => false
  end

  add_index "contents_images", ["content_id"], :name => "index_contents_images_on_content_id"
  add_index "contents_images", ["front_page"], :name => "index_contents_images_on_front_page"
  add_index "contents_images", ["image_id"], :name => "index_contents_images_on_image_id"

  create_table "contents_users", :id => false, :force => true do |t|
    t.integer "content_id"
    t.integer "user_id"
  end

  add_index "contents_users", ["content_id"], :name => "index_contents_users_on_content_id"
  add_index "contents_users", ["user_id"], :name => "index_contents_users_on_user_id"

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delivery_methods", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "provider"
    t.string   "url"
    t.string   "tracker_url"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "editions", :force => true do |t|
    t.integer  "publication_id"
    t.string   "name"
    t.text     "body"
    t.date     "edition_date"
    t.boolean  "has_flip",                   :default => false
    t.integer  "number_of_printed_magazine"
    t.integer  "pages_of_printed_magazine"
    t.boolean  "enabled",                    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "editions", ["edition_date"], :name => "index_editions_on_edition_date"
  add_index "editions", ["enabled"], :name => "index_editions_on_enabled"
  add_index "editions", ["has_flip"], :name => "index_editions_on_has_flip"
  add_index "editions", ["publication_id"], :name => "index_editions_on_publication_id"

  create_table "editorial_props", :id => false, :force => true do |t|
    t.integer  "content_id"
    t.integer  "number"
    t.integer  "editorial_id"
    t.datetime "published_at"
    t.boolean  "primary",            :default => false
    t.boolean  "show_in_front_page", :default => false
  end

  add_index "editorial_props", ["content_id"], :name => "index_editorial_props_on_content_id"
  add_index "editorial_props", ["editorial_id"], :name => "index_editorial_props_on_editorial_id"
  add_index "editorial_props", ["number"], :name => "index_editorial_props_on_number"
  add_index "editorial_props", ["primary"], :name => "index_editorial_props_on_primary"
  add_index "editorial_props", ["published_at"], :name => "index_editorial_props_on_published_at"
  add_index "editorial_props", ["show_in_front_page"], :name => "index_editorial_props_on_show_in_front_page"

  create_table "editorials", :force => true do |t|
    t.integer  "publication_id"
    t.integer  "parent_id"
    t.integer  "children_count"
    t.integer  "ancestors_count"
    t.integer  "descendants_count"
    t.boolean  "hidden"
    t.string   "name"
    t.string   "description"
    t.integer  "position"
    t.boolean  "include_in_newsletter", :default => true
    t.boolean  "enabled",               :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "editorials_users", :id => false, :force => true do |t|
    t.integer "user_id",      :null => false
    t.integer "editorial_id", :null => false
  end

  add_index "editorials_users", ["editorial_id"], :name => "index_editorials_users_on_editorial_id"
  add_index "editorials_users", ["user_id"], :name => "index_editorials_users_on_user_id"

  create_table "event_agendas", :force => true do |t|
    t.integer  "event_id"
    t.integer  "event_type_id"
    t.string   "location"
    t.string   "name"
    t.string   "author"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "enabled",       :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "localization"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "include_in_newsletter",  :default => false
    t.boolean  "include_in_events_menu", :default => false
    t.boolean  "enable_ticker",          :default => false
    t.boolean  "enable_slideshow",       :default => false
    t.string   "url"
    t.boolean  "enabled",                :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eyes", :force => true do |t|
    t.integer  "content_id"
    t.string   "preliminary_title"
    t.string   "sentence"
    t.string   "author"
    t.string   "author_description"
    t.string   "language"
    t.boolean  "enabled",            :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "helps", :force => true do |t|
    t.string   "controller"
    t.string   "action"
    t.string   "name"
    t.text     "body"
    t.boolean  "enabled",    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "helps", ["action"], :name => "index_helps_on_action"
  add_index "helps", ["controller"], :name => "index_helps_on_controller"

  create_table "image_categories", :force => true do |t|
    t.string   "name"
    t.boolean  "enabled",    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.integer  "image_category_id"
    t.integer  "user_id"
    t.string   "name"
    t.text     "subtitle"
    t.string   "credits"
    t.string   "image_filename"
    t.integer  "image_width"
    t.integer  "image_height"
    t.boolean  "enabled",           :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "intranet_ips", :id => false, :force => true do |t|
    t.integer  "intranet_id"
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "intranet_ips", ["intranet_id"], :name => "index_intranet_ips_on_intranet_id"
  add_index "intranet_ips", ["ip"], :name => "index_intranet_ips_on_ip"

  create_table "intranets", :force => true do |t|
    t.string   "name"
    t.integer  "be_system_id"
    t.string   "logo"
    t.string   "email"
    t.string   "contact"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "intranets", ["be_system_id"], :name => "index_intranets_on_be_system_id"
  add_index "intranets", ["enabled"], :name => "index_intranets_on_enabled"

  create_table "logs", :force => true do |t|
    t.integer  "user_id"
    t.string   "ip",         :limit => 15
    t.string   "model"
    t.string   "controller"
    t.string   "action"
    t.integer  "object_id"
    t.integer  "status",     :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "logs", ["action"], :name => "index_logs_on_action"
  add_index "logs", ["controller"], :name => "index_logs_on_controller"
  add_index "logs", ["ip"], :name => "index_logs_on_ip"
  add_index "logs", ["model"], :name => "index_logs_on_model"
  add_index "logs", ["object_id"], :name => "index_logs_on_object_id"
  add_index "logs", ["status"], :name => "index_logs_on_status"

  create_table "mail_delivery_sessions", :force => true do |t|
    t.integer  "user_id",                                            :null => false
    t.integer  "mail_gateway_id", :default => 0,                     :null => false
    t.integer  "status",          :default => 0
    t.datetime "start"
    t.datetime "end"
    t.datetime "force_end"
    t.time     "keepalive",       :default => '2000-01-01 00:00:30'
    t.integer  "total_sent",      :default => 0
    t.text     "log"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mail_delivery_sessions", ["end"], :name => "index_mail_delivery_sessions_on_end"
  add_index "mail_delivery_sessions", ["keepalive"], :name => "index_mail_delivery_sessions_on_keepalive"
  add_index "mail_delivery_sessions", ["mail_gateway_id"], :name => "index_mail_delivery_sessions_on_mail_gateway_id"
  add_index "mail_delivery_sessions", ["start"], :name => "index_mail_delivery_sessions_on_start"
  add_index "mail_delivery_sessions", ["total_sent"], :name => "index_mail_delivery_sessions_on_total_sent"
  add_index "mail_delivery_sessions", ["user_id"], :name => "index_mail_delivery_sessions_on_user_id"

  create_table "mail_gateways", :force => true do |t|
    t.string   "host"
    t.string   "user"
    t.string   "password"
    t.string   "realm"
    t.boolean  "direct_delivery",   :default => false
    t.boolean  "enabled",           :default => false
    t.integer  "active_session_id"
    t.integer  "priority",          :default => 5
    t.boolean  "ssl",               :default => false
    t.integer  "port",              :default => 25
    t.integer  "sending_interval"
    t.datetime "last_send"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mail_gateways", ["active_session_id"], :name => "index_mail_gateways_on_active_session_id"
  add_index "mail_gateways", ["enabled"], :name => "index_mail_gateways_on_enabled"
  add_index "mail_gateways", ["host"], :name => "index_mail_gateways_on_host"
  add_index "mail_gateways", ["last_send"], :name => "index_mail_gateways_on_last_send"
  add_index "mail_gateways", ["priority"], :name => "index_mail_gateways_on_priority"
  add_index "mail_gateways", ["sending_interval"], :name => "index_mail_gateways_on_sending_interval"

  create_table "medias", :force => true do |t|
    t.string   "name"
    t.string   "acronym"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsletter_groups", :force => true do |t|
    t.integer  "newsletter_session_id"
    t.datetime "start_time"
    t.datetime "keepalive"
    t.datetime "end_time"
    t.text     "html"
    t.text     "text"
    t.integer  "total_recipients"
    t.integer  "total_sent"
    t.integer  "total_bounce"
    t.float    "average_transmission_time"
    t.integer  "total_posts_clicked"
    t.integer  "total_posts_displayed"
    t.string   "subject"
    t.string   "email_sender"
    t.string   "email_bounce"
    t.string   "email_sender_name"
    t.integer  "newsletter_situation_id",   :default => 1
    t.text     "users_to_send"
    t.integer  "ntype",                                    :null => false
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsletter_messages", :force => true do |t|
    t.integer  "newsletter_group_id"
    t.integer  "user_id"
    t.string   "user_name"
    t.string   "user_email"
    t.datetime "run_at"
    t.text     "log"
    t.boolean  "sended"
    t.integer  "bounces"
    t.integer  "views"
    t.integer  "clicks"
    t.integer  "newsletter_situation_id", :default => 1
    t.integer  "transmission"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsletter_sessions", :force => true do |t|
    t.integer  "user_id",                                                    :null => false
    t.string   "action_send"
    t.integer  "publication_id"
    t.integer  "newsletter_type"
    t.date     "published_at"
    t.text     "comment"
    t.integer  "newsletter_situation_id", :default => 1
    t.datetime "start"
    t.datetime "end"
    t.datetime "force_end"
    t.time     "keepalive",               :default => '2000-01-01 00:00:30'
    t.integer  "total_sent",              :default => 0
    t.text     "log"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsletter_situations", :force => true do |t|
    t.string   "name"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsletter_templates", :force => true do |t|
    t.integer  "publication_id"
    t.string   "model",                                :null => false
    t.integer  "ntype",                                :null => false
    t.string   "name",                                 :null => false
    t.text     "description"
    t.string   "subject",                              :null => false
    t.text     "comment"
    t.boolean  "ad_enabled",        :default => false
    t.string   "ad_src"
    t.string   "ad_href"
    t.string   "file"
    t.boolean  "enabled",           :default => false
    t.string   "email_sender"
    t.string   "email_bounce"
    t.string   "email_sender_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_details", :force => true do |t|
    t.integer  "order_id"
    t.integer  "name"
    t.integer  "price",      :limit => 10, :precision => 10, :scale => 0
    t.integer  "quantity"
    t.integer  "total",      :limit => 10, :precision => 10, :scale => 0
    t.integer  "product_id"
    t.boolean  "frete"
    t.integer  "weight",     :limit => 10, :precision => 10, :scale => 0
    t.integer  "width",      :limit => 10, :precision => 10, :scale => 0
    t.integer  "height",     :limit => 10, :precision => 10, :scale => 0
    t.integer  "depth",      :limit => 10, :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.integer  "payment_method_id"
    t.integer  "deliver_id"
    t.integer  "status"
    t.integer  "parcel"
    t.integer  "parcel_value"
    t.integer  "price",                 :limit => 10, :precision => 10, :scale => 0
    t.integer  "shipping",              :limit => 10, :precision => 10, :scale => 0
    t.integer  "total",                 :limit => 10, :precision => 10, :scale => 0
    t.string   "tracking"
    t.string   "hash_name"
    t.text     "return"
    t.string   "billing_name"
    t.string   "billing_street"
    t.string   "billing_number"
    t.string   "billing_completion"
    t.string   "billing_zip"
    t.string   "billing_neighborhood"
    t.string   "billing_city"
    t.string   "billing_state"
    t.string   "billing_country"
    t.string   "billing_area_code"
    t.string   "billing_telephone"
    t.text     "billing_reference"
    t.string   "shipping_name"
    t.string   "shipping_street"
    t.string   "shipping_number"
    t.string   "shipping_completion"
    t.string   "shipping_zip"
    t.string   "shipping_neighborhood"
    t.string   "shipping_city"
    t.string   "shipping_state"
    t.string   "shipping_country"
    t.string   "shipping_area_code"
    t.string   "shipping_telephone"
    t.text     "shipping_reference"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_methods", :force => true do |t|
    t.string   "name"
    t.string   "identification"
    t.string   "environment"
    t.string   "provider"
    t.string   "module"
    t.string   "operation"
    t.string   "flag"
    t.integer  "parcels"
    t.decimal  "minimum_parcel", :precision => 14, :scale => 2, :default => 0.0
    t.string   "url"
    t.string   "confirm_url"
    t.string   "coupun_url"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "controller"
    t.string   "action"
    t.string   "fields",      :default => "all"
    t.boolean  "enabled",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "permissions", ["action"], :name => "index_permissions_on_action"
  add_index "permissions", ["controller"], :name => "index_permissions_on_controller"
  add_index "permissions", ["enabled"], :name => "index_permissions_on_enabled"
  add_index "permissions", ["name"], :name => "index_permissions_on_name"

  create_table "permissions_roles", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "permission_id"
  end

  add_index "permissions_roles", ["permission_id"], :name => "index_permissions_roles_on_permission_id"
  add_index "permissions_roles", ["role_id"], :name => "index_permissions_roles_on_role_id"

  create_table "pld_datas", :force => true do |t|
    t.integer  "year"
    t.integer  "month"
    t.integer  "week"
    t.date     "start_date"
    t.date     "end_date"
    t.float    "pesado_se"
    t.float    "medio_se"
    t.float    "leve_se"
    t.float    "pesado_s"
    t.float    "medio_s"
    t.float    "leve_s"
    t.float    "pesado_ne"
    t.float    "medio_ne"
    t.float    "leve_ne"
    t.float    "pesado_n"
    t.float    "medio_n"
    t.float    "leve_n"
    t.boolean  "enabled",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_categories", :force => true do |t|
    t.string   "name"
    t.boolean  "enabled",    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_positions", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publications", :force => true do |t|
    t.string   "name"
    t.string   "internal"
    t.string   "model"
    t.text     "body"
    t.boolean  "has_edition",    :default => false
    t.boolean  "has_newsletter", :default => false
    t.boolean  "has_clipping",   :default => false
    t.boolean  "enabled",        :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publications", ["enabled"], :name => "index_publications_on_enabled"
  add_index "publications", ["has_clipping"], :name => "index_publications_on_has_clipping"
  add_index "publications", ["has_edition"], :name => "index_publications_on_has_edition"
  add_index "publications", ["has_newsletter"], :name => "index_publications_on_has_newsletter"
  add_index "publications", ["internal"], :name => "index_publications_on_internal"
  add_index "publications", ["model"], :name => "index_publications_on_model"
  add_index "publications", ["name"], :name => "index_publications_on_name"

  create_table "publications_users", :id => false, :force => true do |t|
    t.integer  "user_id",                                 :null => false
    t.integer  "publication_id",                          :null => false
    t.boolean  "receive_newsletter",   :default => false
    t.datetime "last_sync"
    t.integer  "subscription_type_id",                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publications_users", ["publication_id"], :name => "index_publications_users_on_publication_id"
  add_index "publications_users", ["receive_newsletter"], :name => "index_publications_users_on_receive_newsletter"
  add_index "publications_users", ["subscription_type_id"], :name => "index_publications_users_on_subscription_type_id"
  add_index "publications_users", ["user_id"], :name => "index_publications_users_on_user_id"

  create_table "relateds_products", :id => false, :force => true do |t|
    t.integer "product_id"
    t.integer "related_id"
  end

  create_table "replies", :force => true do |t|
    t.integer  "contact_id"
    t.integer  "user_id"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservoir_datas", :force => true do |t|
    t.float    "sub_seco"
    t.float    "sub_s"
    t.float    "sub_ne"
    t.float    "sub_n"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
    t.boolean  "enabled",    :default => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "enabled",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["enabled"], :name => "index_roles_on_enabled"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "simple_captcha_data", :force => true do |t|
    t.string   "key",        :limit => 40
    t.string   "value",      :limit => 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscription_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "content_type"
    t.string   "taggable_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "login",                                  :null => false
    t.string   "email",                                  :null => false
    t.string   "crypted_password",                       :null => false
    t.string   "password_salt",                          :null => false
    t.string   "persistence_token",                      :null => false
    t.string   "single_access_token",                    :null => false
    t.string   "perishable_token",                       :null => false
    t.integer  "login_count",         :default => 0,     :null => false
    t.integer  "failed_login_count",  :default => 0,     :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.boolean  "enabled",             :default => false
    t.boolean  "can_login",           :default => false
    t.boolean  "delta",               :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by",          :default => 1,     :null => false
    t.integer  "changed_by"
    t.integer  "origin_id"
    t.integer  "be_system_id"
    t.integer  "intranet_id"
    t.datetime "last_sync"
    t.boolean  "receive_tests",       :default => false
  end

  add_index "users", ["receive_tests"], :name => "index_users_on_receive_tests"

end
