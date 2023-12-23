# law_office_search（法律事務所ナビ）
法律事務所ナビは、法律事務所の検索サイトです。<br>
法律事務所の営業時間、所在地（Googleマップ）、口コミなどを確認することができます。<br>
また、ログインすれば各事務所に口コミを投稿することができます。

<img width="1425" alt="スクリーンショット 2023-12-18 17 57 27" src="https://github.com/kawakami1995/law_office_search/assets/127808281/93897d5b-bb35-4f03-ae22-40d3b2a342c8">

## URL
https://law-office-search-e86cd269003b.herokuapp.com/

## 作成の背景
従来の法律事務所検索サイトは、口コミが投稿できないor良い口コミしか投稿できないサイトばかりでした。  
しかし、法的な問題を抱えているユーザーからすれば、弁護士選びは最も重要な要素の1つです。  
そして、弁護士を選ぶ際には良い口コミだけではなく、悪い口コミも重要な判断材料といえます。  
なぜなら、口コミ機能がない場合、そもそも法律事務所の評判を判断することは非常に難しいです。  
また、良い口コミしか存在しない場合、サクラなどによる口コミの捏造の可能性が否定できず、同様に法律事務所の評判を判断することは非常に難しいです。  
そこで、法律事務所ナビでは従来の法律事務所検索機能に加え、各事務所の口コミを投稿できるようにしました。

## 使用技術
- Ruby 3.2.2  
- Ruby on Rails 6.1.7.6  
- node.js v21.1.0
- PostgreSQL 15.5
- RSpec
- RuboCop
- Google Maps API

## 機能一覧
- ログイン機能(devise)
  - サインアップ・サイインイン・ログアウト
    <img width="1440" alt="スクリーンショット ログイン" src="https://github.com/kawakami1995/law_office_search/assets/127808281/ebd25955-665d-4cd8-b020-19e0053777cb">
- マイページ
  - メールアドレス・ユーザーネーム編集
    <img width="1427" alt="スクリーンショット マイページ" src="https://github.com/kawakami1995/law_office_search/assets/127808281/c7cc1751-8656-4406-be57-6a2cf267a859">
  - 投稿した口コミ
    <img width="1440" alt="スクリーンショット マイページ2" src="https://github.com/kawakami1995/law_office_search/assets/127808281/ae11c6b5-159c-4316-b9e5-771442e4771b">
- 法律事務所検索機能
  - 検索結果一覧
    <img width="1440" alt="スクリーンショット 検索結果一覧" src="https://github.com/kawakami1995/law_office_search/assets/127808281/124d21de-0413-400b-8d95-59344c9cb481">
  - 法律事務所詳細
    <img width="1436" alt="スクリーンショット 法律事務所詳細" src="https://github.com/kawakami1995/law_office_search/assets/127808281/2912c081-99a2-43c8-b076-2d2d6043aa6a">
    <img width="1435" alt="スクリーンショット 法律事務所詳細2" src="https://github.com/kawakami1995/law_office_search/assets/127808281/47d221ea-d4a9-4ba6-b0a3-1a11601e8b88">
    <img width="1440" alt="スクリーンショット 法律事務所詳細3" src="https://github.com/kawakami1995/law_office_search/assets/127808281/7a355cb2-b0d4-4e2c-b169-39b6c19aa82d">
- 口コミ投稿機能
- お気に入り登録機能

## テスト
- RSpec
  - 単体テスト(model)
  - 機能テスト(request)
