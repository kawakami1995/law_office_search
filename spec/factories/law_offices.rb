FactoryBot.define do
  factory :law_office1, class: LawOffice do
    office_name { '成歩堂法律事務所' }
    representative_lawyer_name { '成歩堂龍一' }
    postal_code { 1111111 }
    address { '東京都千代田区0-0-0' }
    phone_number { '00-0000-0001' }
    business_hours { '10:00-18:00' }
    office_url { Faker::Internet.url }
    focus { '刑事事件' }
  end

  factory :law_office2, class: LawOffice do
    office_name { '御剣法律事務所' }
    representative_lawyer_name { '御剣信' }
    postal_code { 1111112 }
    address { '千葉県千葉市中央区0-0-0' }
    phone_number { '00-0000-0002'}
    business_hours { '10:00-18:00' }
    office_url { Faker::Internet.url }
    focus { '交通事故' }
  end
end
