class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.string :name,               null: false
      t.text :remarks
      t.text :shop
      t.date :deadline
      t.integer :quantity
      t.references :category,       null: false, foregin_key: true
      t.timestamps
    end
  end
end
