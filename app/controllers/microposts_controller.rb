# encoding: utf-8
class MicropostsController < ApplicationController
  before_filter :authenticate
  def create
    @micropost=current_user.microposts.build(params[:micropost])
    if @micropost.save
      redirect_to root_path, :flash =>{:success=>"Сообщение создано!"}
    else
      render 'home/index'
    end


  end
  def destroy

  end

end