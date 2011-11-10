class PublicUsersController < ApplicationController
       layout 'public'

  def show
    @public_user= PublicUser.find(params[:id])
  end
  def new
  end


end
