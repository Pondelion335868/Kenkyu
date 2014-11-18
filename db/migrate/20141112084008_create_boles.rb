class CreateBoles < ActiveRecord::Migration
  def change
    create_table :boles do |t|
      t.string :title
      t.string :name
      t.text :comment

      t.timestamps
    end
  end
end
