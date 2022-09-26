class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum availability: %i[available unavailable]

  enum user_type: {developer:'Developer', manager:'Manager', admin:'Admin', qa:'QA'}

  has_many :created_projects, class_name: 'Project', foreign_key: 'manager_id'
  has_many :user_projects
  has_many :projects, through: :user_projects

  scope :show_user, -> { select(:id,:name,:user_type).where(user_type: ["developer","qa"])}

  def destroy
    update_attributes(availability: available)
  end

  def display_users
    "#{name} (#{user_type})"
  end

  def active_for_authentication?
    if self.availability == "unavailable"
      super && !availability
    else
      super && availability
    end
  end
end
