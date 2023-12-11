require 'rails_helper'

RSpec.describe LawOffice, type: :model do
  describe 'バリデーション' do
    it '有効なファクトリを持つこと' do
      expect(build(:law_office1)).to be_valid
    end

    it '法律事務所名が必須である' do
      law_office = build(:law_office1, office_name: nil)
      expect(law_office).to_not be_valid
      expect(law_office.errors[:office_name]).to include('を入力してください')
    end

    it '代表弁護士が必須である' do
      law_office = build(:law_office1, representative_lawyer_name: nil)
      expect(law_office).to_not be_valid
      expect(law_office.errors[:representative_lawyer_name]).to include('を入力してください')
    end

    it '郵便番号が必須である' do
      law_office = build(:law_office1, postal_code: nil)
      expect(law_office).to_not be_valid
      expect(law_office.errors[:postal_code]).to include('を入力してください')
    end

    it '郵便番号が7桁である' do
      law_office = build(:law_office1, postal_code: '123456')
      expect(law_office).to_not be_valid
      expect(law_office.errors[:postal_code]).to include('は7文字で入力してください')
    end

    it '住所が必須である' do
      law_office = build(:law_office1, address: nil)
      expect(law_office).to_not be_valid
      expect(law_office.errors[:address]).to include('を入力してください')
    end

    it '電話番号が必須である' do
      law_office = build(:law_office1, phone_number: nil)
      expect(law_office).to_not be_valid
      expect(law_office.errors[:phone_number]).to include('を入力してください')
    end

    it '電話番号が正しいフォーマットであること' do
      law_office = build(:law_office1, phone_number: 'abc-12345')
      expect(law_office).to_not be_valid
      expect(law_office.errors[:phone_number]).to include('は半角数字またはハイフンのみ入力できます')
    end

    it '営業時間が必須である' do
      law_office = build(:law_office1, business_hours: nil)
      expect(law_office).to_not be_valid
      expect(law_office.errors[:business_hours]).to include('を入力してください')
    end

    it '事務所URLが必須である' do
      law_office = build(:law_office1, office_url: nil)
      expect(law_office).to_not be_valid
      expect(law_office.errors[:office_url]).to include('を入力してください')
    end

    it 'focusが必須である' do
      law_office = build(:law_office1, focus: nil)
      expect(law_office).to_not be_valid
      expect(law_office.errors[:focus]).to include('を入力してください')
    end
  end
end
