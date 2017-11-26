class HomeController < ApplicationController
  def home
  end

  def login
    if params[:id] == "id" && params[:pw] == "password" then
      @user_name = "かず"
      render 'mypage/mypage'
    else
      redirect_to action: :home, message: "IDまたはPasswordが違います！"
    end
  end
end
