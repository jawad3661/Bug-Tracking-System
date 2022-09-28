class Developer::ProjectsController < ApplicationController
  before_action :validate_developer

  def index
    @projects = current_user.projects
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def validate_developer
    return if current_user&.developer?

    redirect_to root_path, notice: 'Cant Access'
  end
end
