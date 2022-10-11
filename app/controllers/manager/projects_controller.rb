class Manager::ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  before_action :set_authorize, only: %i[show edit update destroy]

  def index
    @projects = current_user.created_projects.order(:title).page params[:page]
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
  end

  def edit; end

  def update
      @project.update(project_params)
  end

  def destroy
    @project.destroy
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
