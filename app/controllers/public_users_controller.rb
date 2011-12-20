# encoding: utf-8
class PublicUsersController < ApplicationController
  layout 'public'

  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => [:destroy]

  def index
    @public_users=PublicUser.paginate(:page=>params[:page])
  end

  def show
    @public_user= PublicUser.find(params[:id])
    @microposts = @public_user.microposts.paginate(:page=>params[:page])
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


  end

  def update

    if @public_user.update_attributes(params[:public_user])

      redirect_to @public_user, :flash=>{:success=>"Профиль обновлен!"}
    else
      render 'edit'
    end

  end

  def destroy
       @public_user.destroy
       redirect_to public_users_path, :flash=>{:success => "Пользователь удален."}
  end

  private

  def authenticate
    deny_access unless signed_in?
  end

  def correct_user
    @public_user = PublicUser.find(params[:id])
    redirect_to(signin_path) unless current_user?(@public_user)
  end

  def admin_user
    @public_user = PublicUser.find(params[:id])
    redirect_to(signin_path) if !current_user.admin? || current_user?(@public_user)
  end
end
