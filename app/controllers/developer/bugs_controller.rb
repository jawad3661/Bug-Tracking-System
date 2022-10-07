class Developer::BugsController < ApplicationController
  before_action :set_project, only: :show
  before_action :set_bug, only: %i[edit update update_solver]
  before_action :set_authorize, only: %i[ edit update]


  def show
    @bugs = @project.bugs
    authorize [:developer, @bugs]
  end

  def update_solver
    if @bug.solver_id
      @bug.update_attribute(:solver_id, nil)
      redirect_to developer_project_bug_path(@bug.project_id,@bug), notice: "Remove Solver (#{current_user.name}) from (#{@bug.title}) Bug"
    else
      @bug.update_attribute(:solver_id, current_user.id)
      redirect_to developer_project_bug_path(@bug.project_id,@bug), notice: "Add Solver (#{current_user.name}) to (#{@bug.title}) Bug"
    end
  end

  def edit; end

  def update
    if @bug.update(bug_params)
      redirect_to developer_project_path(@bug.project_id), notice: 'Bug was edited successfully!'
    else
      redirect_to edit_developer_project_bug_path(@bug.project_id, @bug), alert: @bug.errors.full_messages.to_sentence
    end
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

  def bug_params
    params.require(:bug).permit(:title, :description, :deadline, :bug_type, :status, :project_id, :solver_id, :screnshot)
  end
end

