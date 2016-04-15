require 'rails_helper'

RSpec.describe ShortVisitsController, type: :controller do

  before do
    @user = User.create(name: "jeeva", email: "jeeva@gmail.com",password: "default123")
    @user.short_urls.create(original_url: "http://gmail.com/")
    session[:user_id] = @user.id
  end

  def valid_attributes
    {
        short_url_id: 1,
        visitor_ip: "1.1.1.1",
        visitor_country_iso2: "India",
    }
  end

  it  "should authenticate to the user" do
    get :show
    expect login_path
  end

end
