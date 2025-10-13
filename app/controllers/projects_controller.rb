class ProjectsController < ApplicationController
	def index
		@projects = Project.all
	end

	def show
		@project = Project.find(params[:id])
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)

		if @project.save
			flash[:notice] = "Project created successfully"
			redirect_to_project_path(@project)
		else
			render :new, status: :unprocessable_entity
		end
	end

	def edit
		@project = Project.edit(params[:id])
	end

	def update
		@project = Project.find(params[:id])

		if @project.update(project_params)
			flash[:notice] = "Project edited successfully"
			redirect_to_project_path(@project)
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def project_params
		params.require(:project).permit(:name)
	end
end	
