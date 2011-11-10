class PublicUsersController < ApplicationController
       layout 'public'
  def new
  end
  def show
    @public_user= PublicUser.find(params[:id])
  end

end
