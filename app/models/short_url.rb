class ShortUrl < ApplicationRecord
  belongs_to :user, optional: true
  after_initialize :set_default_expiration, if: :new_record?

  private
  def set_default_expiration
    self.expires_at ||= 7.days.from_now
  end
end
