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
    respond_to do |format|
      if user
        log_in user
        format.js { @status = "success" }
        redirect_to "/"
      else
        flash[:danger] = 'IDまたはPasswordが違います。'
        format.js { @status = "fail" }
        render 'home'
      end
    end
  end

  def destroy
    log_out
    redirect_to "/"
  end

end
