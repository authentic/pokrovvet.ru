class AdminUsersController < ApplicationController
  layout 'admin'
  before_filter :confirm_logged_in

  def index
    list
    render('list')
  end

  def list
    @admin_users = AdminUser.sorted
  end

  def new
    @admin_user=AdminUser.new
  end

  def create
    #Instantiate a new object using form parameters
    @admin_user=AdminUser.new(params[:admin_user])
    #Save the object
    if @admin_user.save
      #If save succeeds, redirect to the list action
      flash[:notice] = "Admin created successfully."
      redirect_to(:action => 'list')
    else
      #if save fails, redisplay the form so us
      render('new')
    end
  end

  def edit
    @admin_user=AdminUser.find(params[:id])
  end

  def update
    #Find object using form parameters
    @admin_user=AdminUser.find(params[:id])
    #Update the object
    if @admin_user.update_attributes(params[:admin_user])
      #If update succeeds, redirect to the list action
      flash[:notice] = "Admin user updated successfully."
      redirect_to(:action => 'list')
    else
      #if update fails, redisplay the form so us
      render('edit')
    end


  end

  def delete #Display delete record form
    @admin_user=AdminUser.find(params[:id])
  end

  def destroy #Process delete record form
    AdminUser.find(params[:id]).destroy
    flash[:notice] = "Admin user destroyed."
    redirect_to(:action => 'list')
  end

end
