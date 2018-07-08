class SearchController < ApplicationController
  require 'rest-client'
  require 'benchmark'
  require 'json'

  helper_method :sort_direction, :sort_column

  def search
    @item_list = nil
    @now_page = params[:now_page] || "1"
    @input_keyword = params[:keyword]
    items = nil

    # 検索キーワードがサブミットされたとき
    if @input_keyword
      #キャッシュの初期化
#      Rails.cache.delete("items")
#      #楽天Webサービスにリクエストして、検索結果をキャッシュに保存する
#      items = Rails.cache.fetch("items") do
#        create_request_rakuten(@input_keyword, nil)
#      end

       items = create_request_rakuten(@input_keyword, nil, @now_page)
    end
    @item_list = items
  end

  def detail
    @review = Review.new
    #ISBNコードで楽天ブックスAPI検索
    @item = create_request_rakuten(nil, params[:isbn], @now_page)['Items'][0]
    p @item
    @review_list = Review.joins(:user).order(:created_at).select('users.user_name, reviews.review_title, reviews.review_comment, reviews.rate').where(book_isbn: params[:isbn])
  end

  def create_review
    @review = Review.new(params.require(:review).permit(:user_id, :book_isbn, :book_title, :rate, :review_title, :review_comment))
    @review.save
    redirect_to(:action => "detail")
  end

  # 楽天ブックスAPIへのリクエストを作成
  #書籍タイトル、またはisbnコードで検索（どちらにも値がある場合、書籍タイトルを優先）
  def create_request_rakuten(title, isbn, page)
    # constants
    applicationId = "1033840930466977390"
    affiliateId = "164f0b45.0b8b494f.164f0b46.8f1168c4"
    rakuten_books_url = 'https://app.rakuten.co.jp/services/api/BooksBook/Search/20170404'

    params = {}
    params.store   :applicationId  , applicationId
    params.store   :affiliateId    , affiliateId
    params.store   :format         , "json"
    params.store   :formatVersion  , "2"
    if title
      params.store :title          , title
    end
    if isbn
      params.store :isbn           , isbn
    end
    if page
      params.store :page           , page
    end
    params.store   :hits           , "30"

    p params

    res = RestClient.get(rakuten_books_url, {params: params})
    puts "-----------------------------response-----------------------------"
    p res
    puts "------------------------------------------------------------------"
    return JSON.parse(res)
  end

  # テーブルのソート用
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def sort_column
    RakutenBook.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end
end
