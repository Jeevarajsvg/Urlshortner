require 'rails_helper'

RSpec.describe ShortUrlsController, type: :controller do
  def valid_attributes
    {
        original_url: "https://github.com/plataformatec/devise",
        user_id: "1",
    }
  end

  def login_user
    @user = User.create(name: "admin", email: "admin@gmail.com",password: "default123")
    session[:user_id] = @user.id
  end

  it "should authenticate user" do
    get :index
    expect login_path
  end

  it "should be logged in and should get index" do
    login_user
    get :index
    expect :success
    expect !assigns(:short_urls).nil?
  end

  it "should be logged in and should get new" do
    login_user
    get :new
    expect :success
    expect !assigns(:short_url).nil?
  end

  describe "DELETE destroy" do
    it "destroys the requested short_url" do
      @user = User.create(name: "jeeva", email: "jeevaraj@gmail.com",password: "svg")
      short_url = @user.short_urls.create! valid_attributes
      expect {
        xhr :delete, :destroy, {:id => short_url.to_param}
      }.to change(ShortUrl, :count).by(0)
    end
  end
end
