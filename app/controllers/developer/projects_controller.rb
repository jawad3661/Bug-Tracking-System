class Developer::ProjectsController < ApplicationController
  before_action :validate_developer
    before_action :set_project, only: :show

  def index
    @projects = current_user.projects
  end

  def show; end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def validate_developer
    return if current_user&.developer?

    redirect_to root_path, notice: 'Cant Access'
  end
end
