class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.float :price
      t.text :description

      t.timestamps null: false
    end
  end
end
