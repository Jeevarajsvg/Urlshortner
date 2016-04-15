require 'rails_helper'

RSpec.describe ShortUrl, type: :model do

  describe ShortUrl do
    def valid_attributes
      {

          name: "Jeevaraj m.v",
          email: "jeevarajsvg@gmail.com",
          password: "svg",
          password_confirmation: "svg"
      }
    end
    it "should validate fields before save" do
      uesr = User.create!(valid_attributes)
      short_url = uesr.short_urls.new( :original_url => "" )
      short_url.save
      short_url.errors.messages[:original_url] == (["can't be blank "])
    end
  end

end
