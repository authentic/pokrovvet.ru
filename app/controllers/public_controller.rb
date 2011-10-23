class PublicController < ApplicationController
  layout 'public'
  before_filter :setup_navigation


  def index

  end

  def show


    @page=Page.where(:permalink=>params[:id], :visible => true).first
    redirect_to(:controller => "home", :action => 'index') unless @page


  end


  private
  def setup_navigation
    @subjects=Subject.visible.sorted
    @first_page=Page.where(:position => "1", :visible=>true, :permalink=>params[:id])
  end

end
