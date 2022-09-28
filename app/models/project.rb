class Project < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true

  belongs_to :manager, class_name: 'User', foreign_key: 'creator_id'
  has_many :user_projects, dependent: :destroy
  has_many :users, through: :user_projects
end
