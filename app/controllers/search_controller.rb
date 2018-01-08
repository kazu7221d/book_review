class SearchController < ApplicationController
  def search
    if params[:keyword]
      puts "rakuten start"
      #items = RakutenWebService::Books::Book.search(:keyword => params[:keyword])
      items = RakutenWebService::Ichiba::Item.search(:keyword => params[:keyword])
      p items
      puts "rakuten end"
      render 'search'
    else
      items = nil
    end
  end
end
