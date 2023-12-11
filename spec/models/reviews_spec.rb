require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'バリデーション' do
    it '有効なファクトリを持っている' do
      expect(build(:review1)).to be_valid
    end

    it 'レビューが必須である' do
      review = build(:review1, review: nil)
      expect(review).to_not be_valid
      expect(review.errors[:review]).to include('を入力してください')
    end
  end

  describe 'データベース保存' do
    it '有効なデータが保存される' do
      expect { create(:review1) }.to change(Review, :count).by(1)
    end
  end
end
