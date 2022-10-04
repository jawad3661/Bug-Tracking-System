class Project < ApplicationRecord
  belongs_to :manager, class_name: 'User', foreign_key: 'creator_id'

  has_many :user_projects, dependent: :destroy
  has_many :users, through: :user_projects
  has_many :bugs, class_name: 'Bug', foreign_key: 'project_id', dependent: :destroy

  validates :title, presence: true
  validates :title, uniqueness: true
end
