# encoding: utf-8
class AdminUsersController < ApplicationController
  layout 'admin'
 # before_filter :confirm_logged_in
   before_filter :authenticate
   before_filter :admin_user
  def index
    list
    render('list')
  end

  def list
    @admin_users = PublicUser.sorted
  end

  def new
    @admin_user=PublicUser.new
  end

  def create
    #Instantiate a new object using form parameters
    @admin_user=PublicUser.new(params[:admin_user])
    #Save the object
    if @admin_user.save
      #If save succeeds, redirect to the list action
      flash[:notice] = "Пользователь создан."
      redirect_to(:action => 'list')
    else
      #if save fails, redisplay the form so us
      render('new')
    end
  end

  def edit
    @admin_user=PublicUser.find(params[:id])
  end

  def update
    #Find object using form parameters
    @admin_user=PublicUser.find(params[:id])
    #Update the object
    if @admin_user.update_attributes(params[:admin_user])
      #If update succeeds, redirect to the list action
      flash[:success] = "Пользователь обновлен."
      redirect_to(:action => 'list')
    else
      #if update fails, redisplay the form so us
      render('edit')
    end


  end

  def delete #Display delete record form
    @admin_user=PublicUser.find(params[:id])
  end

  def destroy #Process delete record form
    PublicUser.find(params[:id]).destroy
    flash[:notice] = "Пользователь удален."
    redirect_to(:action => 'list')
  end

end

