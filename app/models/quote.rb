class Quote < ActiveRecord::Base
  # quoteデータベースに接続
  establish_connection(:quote)
end
