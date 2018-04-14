class SearchController < ApplicationController

  require 'benchmark'
  require 'rakuten_web_service'
  helper_method :sort_direction, :sort_column
  #取得ページ数
  PAGE_COUNT = 30

  def search
    items = nil
    @item_list = nil
    @input_keyword = params[:keyword]
    #user_id = session['user_id']
    user_id = "0"

    # 検索キーワードがサブミットされたとき
    if @input_keyword
      #楽天Webサービスにリクエストして、検索結果を取得する。
      items = create_request_rakuten(@input_keyword)

      # 前回までの検索結果を削除
      RakutenBook.delete_previous_result(user_id)

      # 検索結果をテーブルにデータを格納
      RakutenBook.set_result(user_id, items)
    end

    # 検索結果の取り出し
    @item_list = RakutenBook.get_result(user_id, sort_direction, sort_column)

  end

  def create_request_rakuten(title)
    items = RakutenWebService::Books::Book.search(:title => params[:keyword], :hits => 30, :page => 1)
    return items
  end

  def detail
    @item = RakutenBook.find(params[:item_id])
  end

  # テーブルのソート用
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def sort_column
    RakutenBook.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end
end
