class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :name
      t.text :body
      t.string :email

      t.timestamps
    end
  end
end
