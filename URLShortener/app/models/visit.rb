class Visit < ActiveRecord::Base
  attr_accessor :id
  validates :visitor_id, :url_id, presence: true

  def self.record_visit!(user, shortened_url)
    Visit.create(visitor_id: user.id, url_id: shortened_url.id)
  end

  belongs_to :visitors,
  primary_key: :id,
  foreign_key: :visitor_id,
  class_name: :User

  belongs_to :urls,
  primary_key: :id,
  foreign_key: :url_id,
  class_name: :ShortenedUrl

end
