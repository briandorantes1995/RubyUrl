class DatabaseCleanupJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    ShortUrl.where("expires_at < ?", Time.current).delete_all
  end
end
