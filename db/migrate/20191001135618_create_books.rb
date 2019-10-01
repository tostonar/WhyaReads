class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.references :author, foreign_key: true
      t.string :purchase_url
      t.string :image_url
      t.string :category

      t.timestamps
    end
  end
end
