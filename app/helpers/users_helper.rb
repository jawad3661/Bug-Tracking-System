module UsersHelper
  def user_options
    User.where(user_type: ["developer","qa"])
  end

  def user_types
    ['user','developer', 'manager','admin', 'qa']
  end
end
