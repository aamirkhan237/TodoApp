# spec/requests/users_spec.rb
require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end
#show
  describe "GET /show" do
    it "returns http success" do
      get user_path(user)
      expect(response).to have_http_status(:success)
    end
  end
end
