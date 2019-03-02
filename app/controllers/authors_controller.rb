class AuthorsController < ApplicationController
  def login_form
  end

  def logout
    session[:user_id] = nil
    redirect_to("/")
  end

  def login
    @author = Author.find_by(email: params[:email], password: params[:password])
    if @author
      session[:user_id] = @author.id
      @user_id = session[:user_id]
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      flash[:notice] = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render :login_form
    end
  end
end
