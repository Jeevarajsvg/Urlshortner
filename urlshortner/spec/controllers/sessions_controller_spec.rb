require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  def valid_attributes
    {
        email: "jeevarajsvg@gmail.com",
        password: "12345",
    }
  end
  it "should create session user" do
    post :create, {:session =>  valid_attributes}
    expect session[:user_id].present?
    expect '/'
    end

end
