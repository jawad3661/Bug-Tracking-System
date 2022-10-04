class Bug < ApplicationRecord
  belongs_to :project, class_name: 'Project', foreign_key: 'project_id'
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  belongs_to :solver, class_name: 'User', foreign_key: 'solver_id', optional: true

  has_one_attached :screnshot

  validates :screnshot, content_type: [:gif, :png]
  validates :title, :bug_type, :status, presence: true
  validates :title, uniqueness: true
end
