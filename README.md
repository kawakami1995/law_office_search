# law_office_search（法律事務所ナビ）
法律事務所ナビは、法律事務所の検索サイトです。<br>
法律事務所の営業時間、所在地（Googleマップ）、口コミなどを確認することができます。<br>
また、ログインすれば各事務所に口コミを投稿することができます。

<img width="1425" alt="スクリーンショット トップページ" src="https://github.com/kawakami1995/law_office_search/assets/127808281/42f6e96c-2243-4da0-ac14-c1f150a9ec82">

## URL
https://law-office-search-e86cd269003b.herokuapp.com/

## 作成の背景
従来の法律事務所検索サイトは、口コミが投稿できないor良い口コミしか投稿できないサイトばかりでした。  
しかし、法的な問題を抱えているユーザーからすれば、弁護士選びは最も重要な要素の1つです。  
そして、弁護士を選ぶ際には良い口コミだけではなく、悪い口コミも重要な判断材料といえます。  
なぜなら、口コミ機能がない場合、そもそも法律事務所の評判を判断することは非常に難しいです。  
また、良い口コミしか存在しない場合、サクラなどによる口コミの捏造の可能性が否定できず、同様に法律事務所の評判を判断することは非常に難しいです。  
そこで、法律事務所ナビでは従来の法律事務所検索機能に加え、各事務所の口コミを投稿できるようにしました。

## 技術
- フロントエンド

| 使用技術  | 詳細 |
| ------------- | ------------- |
| sass-rails    | Sass ファイルをコンパイルし、Rails アプリケーションで使用可能にするためのツールセット  |
| webpacker    　　| JavaScript モジュールをビルドするための Webpack を Rails アプリケーションに統合します。  |
| turbolinks    | ページ遷移を高速化するための JavaScript ライブラリ  |
| jbuilder  　　　　　　　　| JSON ビューを生成するためのビューテンプレートエンジン  |

- バックエンド
  
| 使用技術  | 詳細 |
| ------------- | ------------- |
| Ruby on Rails(6.1.7.6)    | メインフレームワーク  |
| PostgreSQL(15.5)    | データベース  |
| Rspec         | システムスペック・モデルスペックのテストを実行します。  |
| Rubocop  　　　　　　　　 | コードスタイルの一貫性を維持してくれます。  |

- インフラ

| 使用技術  | 詳細 |
| ------------- | ------------- |
| pg            | PostgreSQL データベース用のアダプタ  |
| spring        | アプリケーションの開発環境での高速な起動をサポートするプリローダー  |

- 認証・地理情報関連
  
| 使用技術  | 詳細 |
| ------------- | ------------- |
| devise        | ユーザー認証のためのライブラリ  |
| dotenv-rails  | 環境変数を管理するためのライブラリ  |
| gmaps4rails   | Google Maps API を使用して地図を表示するためのライブラリ  |
| geocoder  　　　　　　　　| 住所や座標などの地理情報の処理をサポートするライブラリ  |


## 全体設計
![law_office_search_インフラ構成図](https://github.com/kawakami1995/law_office_search/assets/127808281/d2c360cf-d5d4-492a-aa6e-214576017492)
![law_office_search_ER drawio](https://github.com/kawakami1995/law_office_search/assets/127808281/06a109e9-4cb8-426a-a91a-930841b39164)

## 機能
- トップページ
  - 非ログイン時
    <img width="1425" alt="スクリーンショット トップページ" src="https://github.com/kawakami1995/law_office_search/assets/127808281/42f6e96c-2243-4da0-ac14-c1f150a9ec82">
    <img width="1429" alt="スクリーンショット トップページ2" src="https://github.com/kawakami1995/law_office_search/assets/127808281/d22df525-65a8-44e4-b016-9f5160e69b11">
  - ログイン時（口コミの中身は表示されません）
    <img width="1427" alt="スクリーンショット トップページ3" src="https://github.com/kawakami1995/law_office_search/assets/127808281/4e250974-245b-4181-9985-462e16515f4c">
- ログイン機能(devise)
  - サインアップ・サイインイン・ログアウト
    <img width="1440" alt="スクリーンショット ログイン" src="https://github.com/kawakami1995/law_office_search/assets/127808281/ebd25955-665d-4cd8-b020-19e0053777cb">
- マイページ
  - メールアドレス・ユーザーネーム編集
    <img width="1422" alt="スクリーンショット マイページ" src="https://github.com/kawakami1995/law_office_search/assets/127808281/a9177b7b-9780-4ca8-9216-6a633c1c6955">
  - お気に入り登録中の事務所情報
    <img width="1417" alt="スクリーンショット マイページ3" src="https://github.com/kawakami1995/hotel_reservation/assets/127808281/654c34f3-edf9-48e1-af0d-5c76324e517c">
  - 投稿した口コミ
    <img width="1427" alt="スクリーンショット マイページ2" src="https://github.com/kawakami1995/law_office_search/assets/127808281/2a6752f4-44b2-497c-9069-6bc0cb8fcd4d">
- 法律事務所検索機能
  - 検索結果一覧（住所順）
    ![スクリーンショット 検索結果一覧](https://github.com/kawakami1995/law_office_search/assets/127808281/600fcc36-ab26-4ffc-9af8-ee29eb9fb01a)
  - 検索結果一覧（レビュー順）
    ![スクリーンショット 検索結果一覧2](https://github.com/kawakami1995/law_office_search/assets/127808281/94ea0084-0442-4ca9-b0c3-794b7692ba05)
  - 法律事務所詳細
    <img width="1424" alt="スクリーンショット 法律事務所詳細" src="https://github.com/kawakami1995/law_office_search/assets/127808281/ec9d0f65-c021-4452-9c69-4c4762d07345">
    <img width="1428" alt="スクリーンショット 法律事務所詳細2" src="https://github.com/kawakami1995/law_office_search/assets/127808281/93cd6e5b-082e-4e70-b745-1b094c2a391c">
    <img width="1427" alt="スクリーンショット 法律事務所詳細3" src="https://github.com/kawakami1995/law_office_search/assets/127808281/b67ccb3b-59c7-4651-81a9-543247e394f6">
- お気に入り登録機能
  <img width="1426" alt="スクリーンショット お気に入り登録" src="https://github.com/kawakami1995/law_office_search/assets/127808281/1692286c-06ff-484e-bb8f-30f69ab4f2dc">
  <img width="1424" alt="スクリーンショット お気に入り登録2" src="https://github.com/kawakami1995/law_office_search/assets/127808281/9198d15e-5ae7-42a5-9853-753456a8f29e">
- 口コミ投稿機能
  <img width="1425" alt="スクリーンショット 口コミ投稿" src="https://github.com/kawakami1995/law_office_search/assets/127808281/f463f84a-76e7-4a82-bf3d-9e4f8b68fa56">

## テスト
- RSpec
  - 単体テスト(model)
  - 結合テスト(system)
