## アプリ名
- ComicBox

## アプリ概要
- 所持している漫画の情報をアプリケーション内で管理する

## URL
--

## 利用方法
- アプリケーション内で漫画を検索し、持っているものを本棚に登録する。
- 登録したい漫画のデータがアプリ内になければ、新規登録で作成する。
- 本棚に登録した漫画には、自分用のメモを書いたり所持状況を記録できる。

## アプリケーションで解決したい課題
- 持っている漫画が多いので、どれを持っているのかを把握したい
- 漫画を重複して買わないように、一目で何巻を買ったかわかるようにしたい
- 昔持っていたもの、読んだことはあるが持っていないもの、電子書籍で読んだものなど
- さまざまな状況にある漫画を一括で管理したい

## 要件定義

### ユーザー登録機能
- 優先度：1
- 目的：本棚に紐付けるユーザーを登録する
- 詳細：本棚を作成するためのアカウントを作成する
- ストーリー：ユーザーページに名前とメールアドレス、パスワードを登録する
            ログイン時はログインボタンが登録ユーザ名に変化する
- 見積もり時間：5

### 漫画登録機能
- 優先度：2
- 目的：アプリケーションで管理するためのデータ入力を行う
- 詳細：表紙画像、タイトル、作者名、巻数を入力して作品データを作成する
- ストーリー：作品追加ページに移動して内容を入力し、保存する
- 見積もり時間：8

### 漫画検索機能
- 優先度：3
- 目的：アプリに登録された漫画を検索する
- 詳細：アプリケーションに登録された漫画の中でキーワード検索を行い、結果を一覧で表示する
- ストーリー：検索窓にキーワードを入力し、タイトルまたは作者名で一致するものを検索して一覧表示する       
- 見積もり時間：8

### 本棚追加機能
- 優先度：4
- 目的：読んだことのある本を本棚に登録する
- 詳細：自分のアカウントに紐づいた本棚に、漫画データを登録する
- ストーリー：漫画データはあることが前提
          作品詳細、または漫画の新規登録の際にフォームにチェックを入れて本棚に登録する
          同じ漫画を重複して登録することはできない
- 見積もり時間：8

### 本棚検索機能
- 優先度：5
- 目的：本棚内の作品を検索する
- 詳細：本棚に登録された漫画の中でキーワード検索を行い、結果を一覧で表示する
- ストーリー：検索窓にキーワードを入力し、タイトルまたは作者名で一致するものを検索して一覧表示する
          検索前は、本棚に登録された漫画を一覧で表示する
- 見積もり時間：8

### 本棚詳細表示機能
- 優先度：6
- 目的：本棚内の漫画について、メモなどの細情報をを表示する
- 詳細：本棚内の漫画の拡大画像、タイトル、作者名、所持状況、メモ書きが見れる。
- ストーリー：本棚検索画面から、漫画をクリックすると詳細表示画面に移行する
            所持状況とメモについては本棚に紐づいたユーザーのみ随時変更できる"
- 見積もり時間：8

### 本棚内削除機能
- 優先度：7
- 目的：本棚に登録した漫画を削除する
- 詳細：本棚に登録していた漫画を本棚から削除する。
- ストーリー：本棚に登録された漫画データはあることが前提
            作品詳細、または検索結果一覧でチェックを入れてボタンを押下し本棚から削除する
- 見積もり時間：2

## 今後の実装予定
- 本棚詳細表示機能については、今後実装予定

## データベース設計
- COMIC-BOX/ComicBox.dio

## git clone
- git clone https://github.com/kamura5656/comic-box.git
- ruby _6.0.0_


## usersテーブル 
| Culumn             | Type   | Options                   | 
| ------------------ | ------ | ------------------------- | 
| nickname           | string | null: false               | 
| email              | string | null: false, unique: true | 
| encrypted_password | string | null: false              |


##Associstion
- has_one :box, optional: true

## comicsテーブル
| Culumn           | Type          | Options                        | 
| ---------------- | ------------- | ------------------------------ | 
| title            | string        | null: false                    | 
| author           | string        | null: false                    |
| volume           | integer       | null: false                    |

##Associstion
- has_many :boxes 

## boxesテーブル
| Culumn    | Type       | Options                        | 
| --------- | ---------- | -------------------------------| 
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |
| status_id | integer    | null: false,                   | 
| comment   | text       |                                | 

##Associstion
- belongs_to :user
- belongs_to :comic
   
  
