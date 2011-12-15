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
       sign_in @public_user
     redirect_to @public_user, :flash => {:success => "Добро пожаловать!"}
     else
       render 'new'
     end
   end
def edit
  @public_user=PublicUser.find(params[:id])

end
  def update
    @public_user =PublicUser.find(params[:id])
    if @public_user.update_attributes(params[:public_user])

       redirect_to @public_user, :flash=>{:success=>"Профиль обновлен!"}
       else
         render 'edit'
    end

  end


end
