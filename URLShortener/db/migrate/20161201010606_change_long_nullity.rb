class ChangeLongNullity < ActiveRecord::Migration
  def change
    change_column :shortened_urls, :long_url, :string, null: true

  end
end
