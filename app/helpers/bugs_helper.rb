module BugsHelper
  def status_types
    ['new', 'started', 'completed', 'resolved']
  end

  def bug_types
    ['feature', 'bug']
  end

  def select_assigned_qa_projects
    current_user.projects.collect { |p| [p.title, p.id] }
  end

  def can_edit_bug?
    current_user.id == @bug.solver_id || @bug.solver_id.present?
  end
end

