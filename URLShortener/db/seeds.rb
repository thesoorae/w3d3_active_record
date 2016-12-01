# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


ActiveRecord::Base.transaction do

  User.destroy_all
  user1 = User.create(:email => "CJ@gmail.com")
  user2 = User.create(:email => "Flarnie@gmail.com")
  user3 = User.create(:email => "Jeff@gmail.com")
  user4 = User.create(:email => "Georges St. Pierre@gmail.com")
  user5 = User.create(:email => "Ned@gmail.com")

  ShortenedUrl.destroy_all
  url1 = ShortenedUrl.create(:user_id => 1, :long_url => "google", :short_url => 'ggl')
  url2 = ShortenedUrl.create(:user_id => 2, :long_url => "facebook", :short_url => 'fb')

end
