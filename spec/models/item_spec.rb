require 'rails_helper'

RSpec.describe 'Itemモデルのテスト', type: :model do
  describe 'varidation' do
    context 'textカラムが空の時' do
      let(:item) { Item.new(text: "") }
      it 'エラーとなること' do
        expect(item).to be_invalid
      end
    end
  end
end