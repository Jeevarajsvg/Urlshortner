require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  def valid_attributes
    {
         name: "Jeevaraj m.v",
         email: "jeevarajsvg@gmail.com",
         password: "svg",
         password_confirmation: "svg"
    }
  end
  describe "POST create" do
    describe "with valid params" do
      it "creates a new User" do
        expect {
          post :create, {:user => valid_attributes}
        }.to change(User, :count).by(1)
      end

    end
  end

end
