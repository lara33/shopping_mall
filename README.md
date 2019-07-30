## Shopping_mall

- 新增 / 讀取 / 編輯 / 刪除 商品
- 檢視 / 清空購物車
- AASM (狀態機)
- 結帳（PayPal）

## Requirements

- Ruby version 2.6.0
- Rails version 5.2.3
- PostgreSQL 11.3

## Usage

### Install Dependency

```s
$ bundle install
```

### Prepare Database

If you didn't have database.

```s
$ rails db:create
```

And run migration to create tables.

```s
$ rails db:migrate
```

### Start server

Start Rails server.

```s
$ rails s
```
