# encoding: utf-8
module SessionsHelper
  def sign_in(public_user)
       cookies.permanent.signed[:remember_token]=[public_user.id, public_user.salt]
    self.current_user = public_user
  end
  def current_user?(public_user)
    public_user == current_user
  end
  def current_user=(public_user)
    @current_user = public_user
  end
  def current_user
    @current_user ||= user_from_remember_token
  end
  def signed_in?
    !current_user.nil?
  end
  def sing_out
    cookies.delete(:remember_token)
      self.current_user=nil
  end
  def deny_access
    redirect_to signin_path, :notice => "Пожалуйста войдите на сайт для редактирования этой страницы."
  end

    private
  def user_from_remember_token
    PublicUser.authenticate_with_salt(*remember_token)
  end
  def remember_token
    cookies.signed[:remember_token]||[nil, nil]
  end
end

