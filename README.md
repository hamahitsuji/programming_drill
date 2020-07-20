# プログラミングドリル
先輩エンジニアが過去に作成したWebアプリケーション（ポートフォリオ）を投稿し、
プログラミング学習者が学習のアウトプット教材として利用します。

## テーマ選定理由
プログラミングの基礎学習を終えた後、スキル向上のためにはアウトプットが重要です。
しかし、現状アウトプットをするにしても独学では教材となるようなものが存在せず、
自信で考案したアプリを作成するか、あるいは既存のWebサイトを模写するかといったことに限られてしまいます。
どのようなアプリを作成すれば良いのか、もっと良いコードの記述方法はないのか等、
一人で学習を進めるには効率が悪い部分が多いため、それを解決するための手段としてこのテーマを選定しました。

## ターゲットユーザ
プログラミング初学者〜中級者、駆け出しエンジニア

## 主な利用シーン
プログラミングの基礎学習を終え、アウトプットによる学習を行いたい時。

## 使用技術
- Ruby 2.5.7
- Ruby on Rails 5.2.4.3
- RSpec
- jQuery, Bootstrap3
- MySQL 5.5.62
- Nginx, Puma
- AWS（EC2, RDS, Route53）
- Capistrano

## 機能一覧
- チャレンジ要素一覧：[スプレッドシート](https://docs.google.com/spreadsheets/d/1BeDFPT9XnqasDAUF5jbDraDXg5rhDRHrpklPOQHjV10/edit#gid=0)

#### ユーザ関連
- 新規登録、ログイン、ログアウト（devise使用）
- Googleアカウントでのログイン機能（devise、Omniauth使用）
- パスワード再設定（devise、ActionMailer使用）
- マイページ、ユーザ情報編集機能
- プロフィールの画像投稿機能（Refile使用）
- フォロー機能
- 退会機能

#### アプリケーション関連
- 一覧表示、詳細表示、新規投稿、編集機能
- ストック機能
- 学習アプリとしての登録、学習管理機能
- 学習者は追加詳細ページ（ヒント、解説ページ等）へのアクセスが可能
- 学習メモ、追加詳細ページはマークダウン記法で記述（marked.js使用）
- タグ機能、入力時自動補完機能（acts-as-taggable-on、tag-it使用）
- 非公開設定機能

#### 質問関連
- アプリに対する質問機能
- 各質問に対する返信機能

#### レビュー関連
- アプリへのレビュー投稿機能（1.0〜5.0の採点及びコメント）
- 点数を☆で表示（raty.js使用）
- 全レビューの平均点をアプリの評価点として表示
- レビューコメントから感情分析による点数自動算出機能（Natural Language API使用）

#### 通知関連
- フォロー、質問、質問の回答、レビューをもらった際の該当者への通知機能
- 通知があることを知らせるマーク表示（確認後は消失）

#### 検索関連
- 開発言語別、タグ別での検索機能
- 検索バーからフリーワードでの検索機能（ransack使用）
- 新着順、評価順、人気順によるソート機能

#### 管理者関連
- アクティビティ確認用のダッシュボード（グラフにchartkick使用）
- 開発言語の新規登録、編集機能
- ユーザ・アプリの一覧表示、強制退会・削除機能

#### その他
- ページネーション機能（kaminari使用）
- 非同期通信（フォロー、ストック、学習状況、質問・回答、レビュー時）
- レスポンシブ対応

## 設計書
- ワイヤーフレーム：[draw.io](https://app.diagrams.net/#G1KerphBwD831cXAGqX6NqlAjefhU4aI78)
- ER図：[draw.io](https://app.diagrams.net/#G1xx9iVmerwVWF2ggC4ToCzU41lyFmU63l)
- データベース設計：[スプレッドシート](https://docs.google.com/spreadsheets/d/1YYXot30SttwSTz31akqoLq9ylPBteUbJpoN9FY035bk/edit#gid=135053792)
- アプリケーション詳細設計：[スプレッドシート](https://docs.google.com/spreadsheets/d/1gScOPmAEcORheQypo-hjmbxNT4ODyXPp8TsA6_r9dAI/edit#gid=0)

## 今後の運用・ビジョン
サイトの運用においては積極的かつ良質なアプリの投稿が必須となるため、将来的には投稿アプリの参照を有料（または有料会員制）にし、
アプリが利用される毎に投稿者に還元される仕組みを構築します。
その結果、先輩エンジニアは自身がこれまでに学習目的で作成したアプリを「作って終わり」とするのではなく、
将来のエンジニアのための学習教材として活用することができるようになります。
最終的には、このサイトによってITエンジニア業界全体のレベルアップ・活性化に繋がることを期待します。

