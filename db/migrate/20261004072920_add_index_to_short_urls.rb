class AddIndexToShortUrls < ActiveRecord::Migration[8.1]
  def change
    add_index :short_urls, :expires_at
  end
end
