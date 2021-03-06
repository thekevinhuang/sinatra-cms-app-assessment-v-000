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

ActiveRecord::Schema.define(version: 2018_05_20_161806) do

  create_table "hero_players", force: :cascade do |t|
    t.integer "hero_id"
    t.integer "player_id"
  end

  create_table "heroes", force: :cascade do |t|
    t.string "name"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.integer "creator_user_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "team_id"
  end

  create_table "roster_players", force: :cascade do |t|
    t.integer "roster_id"
    t.integer "player_id"
  end

  create_table "rosters", force: :cascade do |t|
    t.string "name"
    t.integer "league_id"
    t.integer "user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
  end

  create_table "user_leagues", force: :cascade do |t|
    t.integer "user_id"
    t.integer "league_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "password_digest"
  end

end
