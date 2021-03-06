class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                    null: false
      t.text :explanation,               null: false
      t.integer :price,                  null: false
      t.integer :category_id,            null: false
      t.integer :status_id,              null: false
      t.string :delivery_fee,            null: false
      t.integer :area_id,                null: false
      t.string :term,                    null: false
      t.references :user, foreign_key: true,          null: false
      t.timestamps
    end
  end
end
