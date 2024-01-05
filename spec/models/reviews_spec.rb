require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:law_office1) { FactoryBot.build(:law_office1) }
  let(:review1) { FactoryBot.build(:review1, law_office: law_office1) }

  describe 'バリデーション' do
    it '有効なファクトリを持っている' do
      expect(review1).to be_valid
    end

    it 'レビューが必須である' do
      review = build(:review1, review: nil)
      expect(review).to_not be_valid
      expect(review.errors[:review]).to include('を入力してください')
    end

    it 'レビューの星が必須である' do
      review = build(:review1, star: nil)
      expect(review).to_not be_valid
      expect(review.errors[:star]).to include('を入力してください')
    end
  end

  describe 'データベース保存' do
    it '有効なデータが保存される' do
      expect { create(:review1) }.to change(Review, :count).by(1)
    end
  end
end
