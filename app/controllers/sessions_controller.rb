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
      #handle successful sighin
    end
  end

  def destroy

  end
end
