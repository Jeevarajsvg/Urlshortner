require 'rails_helper'

RSpec.describe ShortUrlsController, type: :controller do
  def valid_attributes
    {
        riginal_url: "https://github.com/plataformatec/devise",
        user_id: "1",
    }
  end
  describe "POST create" do
    describe "with valid params" do
      it "creates a new ShortUrl" do
        expect {
          post :create, {:short_url => valid_attributes}
        }.to change(ShortUrl, :count).by(1)
      end
    end

  end
end
