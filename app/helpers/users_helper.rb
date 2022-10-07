module UsersHelper
  def user_options
    User.where(user_type: ["developer","qa"])
  end
end
