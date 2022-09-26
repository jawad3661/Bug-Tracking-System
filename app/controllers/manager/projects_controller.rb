class Manager::ProjectsController < ApplicationController
  before_action :validate_manager
  before_action :find_project, only: %i[show edit update destroy]
  before_action :get_dev_qa, only: %i[edit new]

  def index
    @project = current_user.created_projects
  end

  def show; end

  def new
      @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.manager = current_user
    if @project.save
       flash[:success] = 'Project was created successfully!'
       redirect_to manager_projects_path(@project)
    else
       render 'new'
    end
  end

  def edit; end

  def update
      if @project.update(project_params)
        flash[:notice] = 'Project was successfully updated'
        redirect_to manager_projects_path(@project)
      else
        render 'edit'
      end
  end

  def destroy
    @project.destroy
    redirect_to manager_projects_path, notice: 'Project was successfully destroyed'
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def get_dev_qa
    @user = User.show_user
  end

  def project_params
      params.require(:project).permit(:title, :description, user_ids: [])
    end

  def validate_manager
    return if current_user&.manager?

    redirect_to root_path, notice: 'Cant Access'
  end
end
