# encoding: utf-8
module SessionsHelper
  def sign_in(public_user)
    session[:public_user_id]= public_user.id
    self.current_user = public_user
  end

  # setter method
  def current_user=(public_user)
    @current_user = public_user
  end

  # getter method
  def current_user
    @current_user ||= PublicUser.find(session[:public_user_id]) if session[:public_user_id]
  end

  def signed_in?
    !current_user.nil?
  end

  def sing_out
    session[:public_user_id] = nil
    self.current_user = nil
  end

  def current_user?(public_user)
    public_user == current_user
  end

  def authenticate
    deny_access unless signed_in?
  end

  def deny_access
    store_location
    redirect_to signin_path, :notice => "Пожалуйста войдите на сайт для редактирования этой страницы."
  end

  def store_location
    session[:return_to] =request.fullpath
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  def clear_return_to
    session[:return_to]=nil
  end
    def admin_user
    redirect_to(signin_path) if !current_user.admin? || current_user?(@public_user)
  end
end

