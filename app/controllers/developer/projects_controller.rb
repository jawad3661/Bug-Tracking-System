class Developer::ProjectsController < ApplicationController
  before_action :set_project, only: :show
  before_action :set_authorize, only: :show

  def index
    @projects = current_user.projects.page(params[:page])
    authorize [:developer, @projects]
  end

  def show; end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def set_authorize
    authorize [:developer, @project]
  end
end
