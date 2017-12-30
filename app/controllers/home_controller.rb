class HomeController < ApplicationController
  def home
    if @message == nil
      @message = ""
    end
  end

  def login
    if params[:id] == "id" && params[:pw] == "password" then
      @user_name = "かず"
      render 'mypage/mypage'
    else
      @message = "IDまたはPasswordが違います！"
      redirect_to '/'
      #redirect_to action: :home, message: "IDまたはPasswordが違います！"
    end
  end

  def new
  end

  def create
    user = User.find_by(user_id: params[:session][:user_id].downcase)
    if user && user.authenticate(params[:session][:password])
      #aaa
    else
      flash[:danger] = 'IDまたはPasswordが違います。'
      render 'home'
    end
  end

  def destroy
  end

end
