class Qa::BugsController < ApplicationController
  before_action :set_bug, only: %i[edit update destroy]

  def new
    @bug = Bug.new
    authorize [:qa, @bug]
  end

  def show
    @project = Project.find(params[:project_id])
    @bugs = @project.bugs.includes(:solver).page(params[:page])
    authorize [:qa, @bugs]
  end

  def create
    @bug = Bug.new(bug_params)
    authorize [:qa, @bug]

    if project_id_exist?
      if @bug.save
      redirect_to qa_project_path(@bug.project_id), notice: 'Bug was created successfully!'
      else
        redirect_to new_qa_project_bug_path, alert: @bug.errors.full_messages.to_sentence
      end
    else
      redirect_to qa_project_path(@bug.project_id), notice: 'Cant Create'
    end
  end

  def edit
    authorize [:qa, @bug]
    if project_id_exist?
    else
      redirect_to qa_project_path(@bug.project_id), notice: 'Cant edit'
    end
  end

  def update
    authorize [:qa, @bug]
    if @bug.update(bug_params)
      redirect_to qa_project_path(@bug.project_id), notice: 'Bug was edited successfully!'
    else
      redirect_to edit_qa_project_bug_path(@bug.project_id, @bug), alert: @bug.errors.full_messages.to_sentence
    end
  end


  def destroy
    authorize [:qa, @bug]
    if project_id_exist?
      @bug.destroy
      redirect_to qa_project_path(@bug.project_id), notice: 'Bug was deleted successfully'
    else
      redirect_to qa_project_path(@bug.project_id), notice: 'Cant Destroy'
    end
  end

  private

  def bug_params
    params.require(:bug).permit(:title, :description, :deadline, :bug_type, :status, :project_id, :creator_id, :solver_id, screnshots: [])
  end

  def set_bug
    @bug = Bug.find(params[:id])
  end

  def project_id_exist?
    @bug.project_id.in? current_user.projects.ids.to_a
  end
end
