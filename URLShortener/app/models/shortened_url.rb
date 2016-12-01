require 'securerandom'

class ShortenedUrl < ActiveRecord::Base

  attr_accessor :long_url, :short_url, :id 

  validates :user_id, :short_url, presence: true
  # validates :long_url, presence: true, uniqueness: true

  def self.random_code
    random = SecureRandom.urlsafe_base64
    if ShortenedUrl.exists?(short_url: random)
      self.random_code
    end
    random
  end

  def self.create_for_user_and_long_url!(user, long_url)
    short = ShortenedUrl.random_code
    ShortenedUrl.create!(user_id: user.id, long_url: long_url, short_url: short)
  end

  belongs_to :submitter,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  has_many :visits,
  primary_key: :id,
  foreign_key: :url_id,
  class_name: :Visit

  has_many :visitors,
  through: :visits,
  source: :visitors

  has_many :distinct_visitors,
  Proc.new { distinct },
  through: :visits,
  source: :visitors



  def num_clicks
    visitors.count
  end

  def num_uniques
    distinct_visitors.count
  end

  def num_recent_uniques
    # visits.select(DISTINCT :visitor_id).where({created_at: (Time.now - 10.minutes)..Time.now})
    unique_clicks.where({created_at: (Time.now - 10.minutes)..Time.now}).count
  end

  def unique_clicks
  visits.select('visitor_id').distinct
  end

end
