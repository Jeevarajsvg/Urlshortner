class ShortVisit < ActiveRecord::Base
  belongs_to :short_url
  validates_presence_of :short_url

end
