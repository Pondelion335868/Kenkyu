class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :grade
      t.string :comment

      t.timestamps
    end
  end
end
