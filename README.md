README
### 開発の理由

問題点：
前職で使用していたシステムでは、下記の問題点がありました。
1. 伝票作成に時間がかかる。
2. 緊急の案件と定期のスケジュールがバッティングする。
3. 急な作業にも対応できるようにしたい。

この問題を解決する為、オリジナルアプリケーションでは下記の
解決策を持ったアプリとなっています。

解決策：
1. 検索機能を充実させること。
2. いつ誰が何を作業しているのか一眼でわかるようすること。
3. 天候に左右される作業が多くある為、天気予報も取得できること。

-------------------------------------------------
開発言語
-------------------------------------------------
* Ruby 3.0.1
* Ruby on Rails 6.0.3

就業Termの技術
-------------------------------------------------
* フォロー機能
* Devise


カリキュラム外の技術
-------------------------------------------------
* gem prown を使ったPDF作成機能
* AWS S3を使用したサンプル動画
* Openweather を利用したAPI機能連携による天気予報情報取得
* gem simple_calendarを利用したカレンダー表示機能
-------------------------------------------------

使用したgem 一例
-------------------------------------------------
* gem 'gimei'
* gem 'seed-fu'
* gem 'jquery-rails'
* gem 'faker'
* gem 'cancancan'
* gem 'rexml'
* gem 'ransack'
* gem 'prawn'
* gem 'prawn-table'
* gem 'simple_calendar', '~>2.0'
* gem 'dotenv-rails'
* gem 'rails-i18n'
* gem 'devise-i18n'
-------------------------------------------------
```
$ https://github.com/satokofuwa/kiyora.git
$ cd kiyora
$ bundle install
$ rails db:create && rails db:migrate
$ rails s
```  

カタログ設計
-------------------------------------------------
https://docs.google.com/spreadsheets/d/1JMhJOQS91-ZK-f73xL2tE2IqoGj7_gT2Rvn__vD_NuI/edit?usp=sharing




テーブル設計
-------------------------------------------------

https://docs.google.com/spreadsheets/d/1JMhJOQS91-ZK-f73xL2tE2IqoGj7_gT2Rvn__vD_NuI/edit?usp=sharing



画面遷移図
--------------------------------------------------
https://cacoo.com/diagrams/E5767nl8L5vTvJeL/10D62
https://github.com/satokofuwa/kiyora/blob/main/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3.pdf



ワイヤーフレーム
-------------------------------------------------
https://cacoo.com/diagrams/E5767nl8L5vTvJeL/57D5A

E-R図
-------------------------------------------------
https://cacoo.com/diagrams/E5767nl8L5vTvJeL/1CD5D



