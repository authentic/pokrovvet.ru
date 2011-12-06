# encoding: utf-8
class PublicUsersController < ApplicationController
       layout 'public'

  def show
    @public_user= PublicUser.find(params[:id])
  end
  def new
  @public_user=PublicUser.new
  end

   def create

     @public_user=PublicUser.new(params[:public_user])
     if @public_user.save
     redirect_to @public_user, :flash => {:success => "Добро пожаловать!"}
     else
       render 'new'
     end

   end
end
