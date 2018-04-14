class CreateRakutenBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :rakuten_books do |t|
      t.string :user_id
      t.string :title
      t.string :titleKana
      t.string :subTitle
      t.string :seriesName
      t.string :seriesNameKana
      t.string :contents
      t.string :contentsKana
      t.string :author
      t.string :authorKana
      t.string :publisherName
      t.string :size
      t.string :itemCaption
      t.string :salesDate
      t.string :itemPrice
      t.string :listPrice
      t.string :discountRate
      t.string :discountPrice
      t.string :itemUrl
      t.string :affiliateUrl
      t.string :smallImageUrl
      t.string :mediumImageUrl
      t.string :largeImageUrl
      t.string :chirayomiUrl
      t.string :availability
      t.string :postageFlag
      t.string :limitedFlag
      t.string :reviewCount
      t.string :reviewAverage
      t.string :booksGenreId
      t.timestamps
    end
  end
end
