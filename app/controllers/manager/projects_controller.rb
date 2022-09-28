class Manager::ProjectsController < ApplicationController
  before_action :validate_manager
  before_action :set_project, only: %i[show edit update destroy]

  def index
    @project = current_user.created_projects
  end

  def show; end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to manager_projects_path(@project), notice: 'Project was created successfully!'
    else
      redirect_to new_manager_project_path, alert: @project.errors.full_messages.to_sentence
    end
  end

  def edit; end

  def update
    if @project.update(project_params)
      redirect_to manager_projects_path(@project), notice: 'Project was successfully updated'
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to manager_projects_path, notice: 'Project was successfully destroyed'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :creator_id, user_ids: [])
  end

  def validate_manager
    return if current_user&.manager?

    redirect_to root_path, notice: 'Cant Access'
  end
end
