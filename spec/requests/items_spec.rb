require 'rails_helper'

RSpec.describe "Items", type: :request do
  let!(:user) { create(:user) }
  let!(:item) { create(:item) }

  describe "GET /index" do
    it "returns http success" do
      get items_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    subject { get new_item_path }
    context 'ログインしているとき' do
      it "returns http success" do
        sign_in user
        subject
        expect(response).to have_http_status(:success)
      end
    end

    context 'ログインしていないとき' do
      it "returns http success" do
        expect(subject).to redirect_to new_user_session_path
      end
    end
  end
end