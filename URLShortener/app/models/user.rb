class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  has_many :submitted_urls,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :ShortenedUrl

  has_many :visited_url_ids,
  primary_key: :id,
  foreign_key: :visitor_id,
  class_name: :Visit

  has_many :visited_urls,
  through: :visited_url_ids,
  source: :urls

  has_many :distinct_visited_urls,
  Proc.new { distinct },
  through: :visited_url_ids,
  source: :urls
end
