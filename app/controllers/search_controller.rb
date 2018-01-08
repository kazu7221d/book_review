class SearchController < ApplicationController
  def search
    if params[:keyword]
      #items = RakutenWebService::Books::Book.search(:keyword => params[:keyword])
      items = RakutenWebService::Ichiba::Item.search(:keyword => params[:keyword])
      p items
      render 'search'
    else
      items = nil
    end
  end
end
