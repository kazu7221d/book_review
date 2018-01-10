class SearchController < ApplicationController
  def search
    require 'rakuten_web_service'
    @items = nil
    @input_keyword = params[:keyword]
    if @input_keyword
      @items = create_request_rakuten(1, @input_keyword)
    end
  end

  def next_page
    @page = params[:page]
    @items = create_request_rakuten(@page, @input_keyword)
  end

  def create_request_rakuten(page, title)
    items = RakutenWebService::Books::Book.search(:title => params[:keyword])
    return items
  end
end
