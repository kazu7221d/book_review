class ChangeItemCaptionToRaktenBooks < ActiveRecord::Migration[5.1]
  #変更後の型
  def up
    change_column :rakuten_books, :itemCaption, :text
  end

  #変更前の型
  def down
    change_column :rakuten_books, :itemCaption, :string
  end
end
