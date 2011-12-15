# encoding: utf-8
class SessionsController < ApplicationController
  layout 'public'

  def new

  end

  def create
    public_user= PublicUser.authenticate(params[:session][:email], params[:session][:password])

    if public_user.nil?
      flash.now[:error] = "Нужно ввести правильный адрес электронной почты и пароль."
      render 'new'
    else
      sign_in public_user
      redirect_back_or public_user
    end
  end

  def destroy
    sing_out
    redirect_to root_path


  end
end
