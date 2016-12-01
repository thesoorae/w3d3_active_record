class EditIndex < ActiveRecord::Migration
  def change
      remove_index :shortened_urls, :long_url
      add_index :shortened_urls, :short_url
  end


end
