class HomeController < ApplicationController
  def home
    if @message == nil
      @message = ""
    end
  end


  def new
  end

  def create
    user = User.find_by(login_id: params[:session][:login_id].downcase)
#    if user && user.authenticate(params[:session][:password])
    if user
      log_in user
      redirect_to mypage_path
    else
      flash[:danger] = 'IDまたはPasswordが違います。'
      render 'home'
    end
  end

  def destroy
  end

end
