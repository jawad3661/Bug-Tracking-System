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
    respond_to do |format|
      if @project.save
        format.js
        format.html {redirect_to manager_projects_path(@project), notice: 'Project was created successfully!'}
      else
        format.js
      end
    end
  end


  def edit; end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html {redirect_to manager_projects_path(@project), notice: 'Project was successfully updated' }
        format.js
      else
        format.js
        format.html {render 'edit' }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html {redirect_to manager_projects_path, notice: 'Project was successfully destroyed'}
      format.js
    end
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
