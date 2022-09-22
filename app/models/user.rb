class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum availability: %i[available unavailable]

  def destroy
    update_attributes(availability: available)
  end

  def active_for_authentication?
    if self.availability == "unavailable"
      super && !availability
    else
      super && availability
    end
  end
end
