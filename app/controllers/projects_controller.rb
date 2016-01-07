class ProjectsController < ApplicationController
	def index
		@projects = Project.all
	end

	def edit
		@project = Project.find(params[:id])
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new
		if @project.update(project_params)
			flash[:notice] = "speichern erfolgreich"
			redirect_to project_path(@project.id)
		else
			render "new"
		end
	end

	def update
		@project = Project.find(params[:id])
		if @project.update(project_params)
			flash[:notice] = "speichern erfolgreich"
			redirect_to project_path(@project.id)
		else
			render "edit"
		end
	end

	def show
		@project = Project.find(params[:id])
	end

	def destroy

		@project = Project.find(params[:id])
		@project.destroy
		redirect_to projects_url

	end

	private
		def project_params
			params.require(:project).permit(:title, :description, :start_date)
		end
end
