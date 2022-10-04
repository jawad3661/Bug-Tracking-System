class Qa::BugsController < ApplicationController
  before_action :set_bug, only: %i[edit update destroy]
  before_action :validate_qa

  def new
    @bug = Bug.new
  end

  def show
    @project = Project.find(params[:project_id])
    @bugs = @project.bugs
  end

  def create
    @bug = Bug.new(bug_params)
    @bug.creator = current_user
    @bug.project_id = params[:project_id]
    if @bug.save
      redirect_to qa_project_path(@bug.project_id), notice: 'Bug was created successfully!'
    else
      redirect_to new_qa_project_bug_path, alert: @bug.errors.full_messages.to_sentence
    end
  end

  def edit; end

  def update
    if @bug.update(bug_params)
      redirect_to qa_project_path(@bug.project_id), notice: 'Bug was edited successfully!'
    else
      redirect_to edit_qa_project_bug_path(@bug.project_id, @bug), alert: @bug.errors.full_messages.to_sentence
    end
  end

  def destroy
    @bug.destroy
    redirect_to qa_project_path(@bug.project_id), notice: 'Bug was deleted successfully'
  end

  private

  def bug_params
    params.require(:bug).permit(:title, :description, :deadline, :bug_type, :status, :project_id, :solver_id, :screnshot)
  end

  def set_bug
    @bug = Bug.find(params[:id])
  end

  def validate_qa
    return if current_user&.qa?

    redirect_to root_path, notice: 'Cant Access'
  end
end
