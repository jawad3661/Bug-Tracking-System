module BugsHelper

  def select_assigned_qa_projects
    current_user.projects.collect { |p| [p.title, p.id] }
  end
end

