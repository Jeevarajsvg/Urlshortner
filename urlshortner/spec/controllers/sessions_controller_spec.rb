require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  def valid_attributes
    {
        email: "jeevarajsvg@gmail.com",
        password: "svg",
    }
  end
  # describe "POST create" do
  #   context "with valid params" do
  #     it "creates a new User" do
  #       expect {
  #         post :create, {:session => valid_attributes}
  #       }.to change(:session, :count).by(1)
  #     end
  #
  #   end
  # end

end
