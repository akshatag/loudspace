class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :url
      t.references :space
      
      t.timestamps null: false
    end
  end
end
