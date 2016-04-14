class User < ActiveRecord::Base
  has_many :short_urls, dependent: :destroy

  has_secure_password

end
