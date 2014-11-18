class Bole < ActiveRecord::Base
  # boleデータベースに接続
  establish_connection(:bole)
end
