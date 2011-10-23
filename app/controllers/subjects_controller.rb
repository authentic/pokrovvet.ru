class SubjectsController < ApplicationController
  layout 'admin'
  before_filter :confirm_logged_in

  def index
    list
    render('list')
  end

  def list
    @subjects = Subject.order("subjects.position ASC")
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject=Subject.new(:name=> 'default')
    @subject_count = Subject.count + 1
  end

  def create
    new_position = params[:subject].delete(:position)
    #Instantiate a new object using form parameters
    @subject=Subject.new(params[:subject])
    #Save the object
    if @subject.save
      @subject.move_to_position(new_position)
      #If save succeeds, redirect to the list action
      flash[:notice] = "Subject created successfully."
      redirect_to(:action => 'list')
    else
      #if save fails, redisplay the form so us
      @subject_count = Subject.count+1
      render('new')
    end

  end

  def edit
    @subject=Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update

    #Find object using form parameters
    @subject=Subject.find(params[:id])
    #Update the object
    new_position = params[:subject].delete(:position)
    if @subject.update_attributes(params[:subject])
      @subject.move_to_position(new_position)
      #If update succeeds, redirect to the list action
      flash[:notice] = "Subject updated successfully."
      redirect_to(:action => 'show', :id=> @subject.id
      )
    else
      #if update fails, redisplay the form so us
      @subject_count = Subject.count
      render('edit')
    end


  end

  def delete #Display delete record form
    @subject=Subject.find(params[:id])
  end

  def destroy #Process delete record form
    subject = Subject.find(params[:id])
    subject.move_to_position(nil)
    subject.destroy
    flash[:notice] = "Subject destroyed."
    redirect_to(:action => 'list')
  end
end
