class Developer::BugsController < ApplicationController
  before_action :set_project, only: :show
  before_action :set_bug, only: %i[update_solver]

  def show
    @bugs = @project.bugs.includes(:solver).page(params[:page])
    authorize [:developer, @bugs]
  end

  def update_solver
    solver_id = @bug.solver_id ? nil : current_user.id

    @bug.update_attribute(:solver_id, solver_id)
    redirect_to developer_project_bug_path(@bug.project_id,@bug), notice: "#{solver_id ? 'Remove' : 'Add'} Solver (#{current_user.name}) from (#{@bug.title}) Bug"
  end

  private

  def set_bug
    @bug = Bug.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_authorize
    authorize [:developer, @bug]
  end
end
