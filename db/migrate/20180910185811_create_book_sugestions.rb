class CreateBookSugestions < ActiveRecord::Migration[5.1]
  def change
    create_table :book_sugestions do |t|
      t.string :editorial
      t.decimal :price
      t.string :author, null: false
      t.string :title, null: false
      t.string :link, null: false
      t.string :publisher
      t.string :year
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end