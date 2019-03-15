module UsersHelper
  def creator?(user)
    if current_user
      current_user.id == user.id
    end
  end
end
