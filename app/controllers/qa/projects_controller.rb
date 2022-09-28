class Qa::ProjectsController < ApplicationController
  before_action :validate_qa

  def index
    @projects = current_user.projects
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def validate_qa
    return if current_user&.qa?

    redirect_to root_path, notice: 'Cant Access'
  end
end
