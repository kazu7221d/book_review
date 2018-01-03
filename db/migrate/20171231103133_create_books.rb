class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.date :publish_date
      t.blob :introduction
      t.string :evaluation

      t.timestamps
    end
  end
end
