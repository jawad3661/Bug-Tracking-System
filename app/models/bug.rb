class Bug < ApplicationRecord
  belongs_to :project, class_name: 'Project', foreign_key: 'project_id'
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  belongs_to :solver, class_name: 'User', foreign_key: 'solver_id', optional: true

  enum bug_type: {feature: 'feature', bug: 'bug'}
  enum status: {pending: 'pending', started: 'started', completed: 'completed', resolved: 'resolved'}

  has_one_attached :screnshot

  validates :screnshot, content_type: [:gif, :png]
  validates :title, :bug_type, :status, presence: true
  validates :title, uniqueness: true
end
