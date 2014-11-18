class User < ActiveRecord::Base
=begin ↓追加してみたけどエラーはかれたのでコメントイン
  db = ActiveRecord::Base.establish_connection(
    adapter: mysql2
    encoding: utf8
    pool: 5
    host: localhost
    socket: /var/run/mysqld/mysqld.sock
    username: nakajima
    password: al-lab
    database: quote_development
  )
  sql = "SELECT * FROM users"
  results = db.connection.select_all(sql)

  results.columns

  results.rows
=end
end
