class AddUniqueIndexToShortUrls < ActiveRecord::Migration[8.1]
  def change
    add_index :short_urls, :code, unique: true
    change_column_null :short_urls, :user_id, true
    change_column_null :short_urls, :code, false
    change_column_null :short_urls, :original_url, false
    change_column_null :short_urls, :expires_at, false
  end
end
