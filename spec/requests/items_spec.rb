require 'rails_helper'

RSpec.describe "Items", type: :request do
  let!(:user) { create(:user) }

  describe "/index" do
    it "returns http success" do
      get items_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "/new" do
    subject { get new_item_path }
    context 'ログインしていないとき' do
      it "ログインページにリダイレクトされること" do
        expect(subject).to redirect_to new_user_session_path
      end
    end
    context 'ログインしているとき' do
      it "returns http success" do
        sign_in user
        subject
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "/create" do
    subject { post items_path, params: { name: "price", price: 200, text: "test"} }

    context 'ログインしていないとき' do
      it "ログインページにリダイレクトされること" do
        expect(subject).to redirect_to new_user_session_path
      end
    end

    context 'ログインしているとき' do
      it "itemが保存できること" do
        sign_in user
        expect {subject}.to change { Item.all.size }.from(0).to(1)
        expect(Item.last.name).to eq "price"
        expect(Item.last.price).to eq 200
      end
    end
  end
end