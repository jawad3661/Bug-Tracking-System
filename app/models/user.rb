class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum user_type: {user: 'user', developer: 'developer', manager: 'manager', admin: 'admin', qa: 'qa'}

  has_many :created_projects, class_name: 'Project', foreign_key: 'creator_id'
  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :created_bugs, class_name: 'Bug', foreign_key: 'creator_id'
  has_many :solved_bugs, class_name: 'Bug', foreign_key: 'solver_id'

  scope :not_admin, -> { where.not(user_type: 'admin') }

  def display_users
    "#{name} (#{user_type.humanize})"
  end

  def active_for_authentication?
    super && !deactivated
  end
end
