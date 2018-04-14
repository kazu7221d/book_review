class RakutenBook < ApplicationRecord

  def self.set_result(user_id, items)
    last_items = items.page(1)
    loop do
      last_items.all.each do |item|
        rbook = RakutenBook.new
        rbook.user_id          = user_id
        rbook.title            = item['title']
        rbook.titleKana        = item['titleKana']
        rbook.subTitle         = item['subTitle']
        rbook.seriesName       = item['seriesName']
        rbook.seriesNameKana   = item['seriesNameKana']
        rbook.contents         = item['contents']
        rbook.contentsKana     = item['contentsKana']
        rbook.author           = item['author']
        rbook.authorKana       = item['authorKana']
        rbook.publisherName    = item['publisherName']
        rbook.size             = item['size']
        rbook.itemCaption      = item['itemCaption']
        rbook.salesDate        = item['salesDate']
        rbook.itemPrice        = item['itemPrice']
        rbook.listPrice        = item['listPrice']
        rbook.discountRate     = item['discountRate']
        rbook.discountPrice    = item['discountPrice']
        rbook.itemUrl          = item['itemUrl']
        rbook.affiliateUrl     = item['affiliateUrl']
        rbook.smallImageUrl    = item['smallImageUrl']
        rbook.mediumImageUrl   = item['mediumImageUrl']
        rbook.largeImageUrl    = item['largeImageUrl']
        rbook.chirayomiUrl     = item['chirayomiUrl']
        rbook.availability     = item['availability']
        rbook.postageFlag      = item['postageFlag']
        rbook.limitedFlag      = item['limitedFlag']
        rbook.reviewCount      = item['reviewCount']
        rbook.reviewAverage    = item['reviewAverage']
        rbook.booksGenreId     = item['booksGenreId']
        rbook.save
      end
      break if !last_items.has_next_page?
      last_items = last_items.next_page
    end
    return
  end

  def self.get_result(user_id, sort_direction, sort_column)
    return RakutenBook.where(user_id: user_id).order(sort_column + ' ' + sort_direction)
  end

  def self.delete_previous_result(user_id)
    if RakutenBook.where(user_id: user_id).count > 0
      RakutenBook.where(user_id: user_id).destroy_all
    end
  end

end
