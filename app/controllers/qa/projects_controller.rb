class Qa::ProjectsController < ApplicationController

  def index
    @projects = current_user.projects
    @all_projects = Project.all
    authorize [:qa, @projects]
  end

  def show
    @project = Project.find(params[:id])
    authorize [:qa, @project]
  end
end
