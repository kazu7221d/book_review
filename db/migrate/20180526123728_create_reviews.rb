class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :user_id
      t.string :book_isbn
      t.string :book_title
      t.string :rate
      t.string :review_title
      t.string :review_comment

      t.timestamps
    end
  end
end
