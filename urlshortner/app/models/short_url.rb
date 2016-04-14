class ShortUrl < ActiveRecord::Base
  belongs_to :user
  has_many :short_visits
  validates_presence_of :original_url, :user

  after_create :generate_slug

  def generate_slug
    self.shorty = self.id.to_s(36)
    self.save
  end
end
