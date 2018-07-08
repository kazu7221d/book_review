# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180623134555) do

  create_table "books", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.string "author"
    t.date "publish_date"
    t.binary "introduction"
    t.string "evaluation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rakuten_books", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "user_id"
    t.string "title"
    t.string "titleKana"
    t.string "subTitle"
    t.string "seriesName"
    t.string "seriesNameKana"
    t.string "contents"
    t.string "contentsKana"
    t.string "author"
    t.string "authorKana"
    t.string "publisherName"
    t.string "size"
    t.text "itemCaption"
    t.string "salesDate"
    t.string "itemPrice"
    t.string "listPrice"
    t.string "discountRate"
    t.string "discountPrice"
    t.string "itemUrl"
    t.string "affiliateUrl"
    t.string "smallImageUrl"
    t.string "mediumImageUrl"
    t.string "largeImageUrl"
    t.string "chirayomiUrl"
    t.string "availability"
    t.string "postageFlag"
    t.string "limitedFlag"
    t.string "reviewCount"
    t.string "reviewAverage"
    t.string "booksGenreId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.string "book_isbn"
    t.string "book_title"
    t.string "rate"
    t.string "review_title"
    t.string "review_comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "login_id"
    t.string "user_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

end
