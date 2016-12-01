class ShortenedUrls < ActiveRecord::Migration
  def change
    create_table :shortened_urls do |t|
      t.integer :user_id, null: false
      t.string :long_url, null: false
      t.string :short_url
      t.timestamps
    end
    add_index :shortened_urls, :user_id
    add_index :shortened_urls, :short_url
  end
end
