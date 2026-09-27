class CreateShortUrls < ActiveRecord::Migration[8.1]
  def change
    create_table :short_urls do |t|
      t.string :code
      t.text :original_url
      t.references :user, null: false, foreign_key: true
      t.datetime :expires_at

      t.timestamps
    end
  end
end
