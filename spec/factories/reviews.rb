FactoryBot.define do
  factory :review1, class: Review do
    user_id { 1 }
    law_office_id { 1 }
    review { '先生のお陰で勝訴することができました。' }
    star { 3.0 }
  end

  factory :review2, class: Review do
    user_id { 1 }
    law_office_id { 2 }
    review { '真剣に対応してもらえなかった気がします' }
    star { 3.0 }
  end

  factory :review3, class: Review do
    user_id { 2 }
    law_office_id { 1 }
    review { '休日や夜間にも対応してもらえました。' }
    star { 3.0 }
  end

  factory :review4, class: Review do
    user_id { 2 }
    law_office_id { 2 }
    review { '弁護士からの返事は遅いです。' }
    star { 3.0 }
  end

  factory :review5, class: Review do
    user_id { 1 }
    law_office_id { 2 }
    review { 'ありがとうございました。' }
    star { 3.0 }
  end

  factory :review6, class: Review do
    user_id { 2 }
    law_office_id { 2 }
    review { '二度と利用しません。' }
    star { 3.0 }
  end
end
