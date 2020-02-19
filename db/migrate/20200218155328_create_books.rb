class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.text :body

      t.timestamps

      t.string :title, null: false
      t.text :body, null: false
    end
  end
end
