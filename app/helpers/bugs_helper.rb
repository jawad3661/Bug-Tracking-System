module BugsHelper
  def select_assigned_qa_projects
    current_user.projects.collect { |p| [p.title, p.id] }
  end

  def bug_label(bug)
    "#{bug.solver_id? ? 'Remove' : 'Add'} Developer"
  end

  def can_assign_bug?(bug)
    current_user.id == bug.solver_id || bug.solver_id.blank?
  end

  def project_id_exist?
    params[:project_id].to_i.in? current_user.project_ids.to_a
  end
end

