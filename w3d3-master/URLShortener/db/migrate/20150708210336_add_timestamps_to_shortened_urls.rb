class AddTimestampsToShortenedUrls < ActiveRecord::Migration
  def change
    add_timestamps :shortened_urls
  end
end
