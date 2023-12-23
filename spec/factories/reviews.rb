FactoryBot.define do
  factory :review1, class: Review do
    user_id { 1 }
    law_office_id { 1 }
    review { '先生のお陰で勝訴することができました。' }
  end

  factory :review2, class: Review do
    user_id { 1 }
    law_office_id { 2 }
    review { '真剣に対応してもらえなかった気がします' }
  end

  factory :review3, class: Review do
    user_id { 2 }
    law_office_id { 1 }
    review { '休日や夜間にも対応してもらえました。' }
  end

  factory :review4, class: Review do
    user_id { 2 }
    law_office_id { 2 }
    review { '弁護士からの返事は遅いです。' }
  end

  factory :review5, class: Review do
    user_id { 1 }
    law_office_id { 2 }
    review { 'ありがとうございました。' }
  end

  factory :review6, class: Review do
    user_id { 2 }
    law_office_id { 2 }
    review { '二度と利用しません。' }
  end
end
