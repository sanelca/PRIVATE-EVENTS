module SessionsHelper
  def sign_in(user)
    remember_token = User.create_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_digest, User.digest(remember_token))
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def logout(user)
   user.remember_digest = nil
   cookies.delete(:remember_token)
  end

  def current_user
    remember_token = cookies[:remember_token]
    if remember_token
    @current_user ||= User.find_by(remember_digest: User.digest(remember_token))
    end
  end

  def signed_in?
    !current_user.nil?
  end

  def logged_in_user
    unless signed_in?
      redirect_to new_session_path
    end
  end
end
