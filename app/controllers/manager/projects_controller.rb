class Manager::ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  before_action :set_authorize, only: %i[show edit update destroy]
  def index
    @projects = current_user.created_projects
    authorize [:manager, @projects]
  end

  def show; end

  def new
    @project = Project.new
    authorize [:manager, @project]
  end

  def create
    @project = Project.new(project_params)
    authorize [:manager, @project]
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

  def set_authorize
    authorize [:manager, @project]
  end

  def project_params
    params.require(:project).permit(:title, :description, :creator_id, user_ids: [])
  end
end
