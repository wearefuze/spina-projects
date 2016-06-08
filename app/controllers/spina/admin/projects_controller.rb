module Spina
  module Admin
    class ProjectsController < AdminController
      before_filter :set_breadcrumb
      before_action :set_project, only: [:show, :edit, :update, :destroy]

      layout "spina/admin/website"

      def show
      end

      def index
        @projects = Project.all
      end

      def new
        add_breadcrumb "New project", spina.new_admin_project_path
        @project = Project.new
      end

      def edit
        add_breadcrumb @project.title
      end

      def create
        add_breadcrumb "New project"
        @project = Project.new(project_params)
        if @project.save
          redirect_to spina.admin_projects_url, notice: "Project successfully created"
        else
          render :new
        end
      end

      def update
        add_breadcrumb @project.title
        if @project.update_attributes(project_params)
          redirect_to spina.admin_projects_url, notice: "Project saved"
        else
          render :edit
        end
      end

      def destroy
        @project.destroy
        redirect_to spina.admin_projects_url, notice: "The project has been deleted"
      end

      private

      def set_project
        @project = Project.find(params[:id])
      end

      def set_breadcrumb
        add_breadcrumb "Projects", spina.admin_projects_path
      end

      def project_params
        params.require(:project).permit(:title, :slug, :description, :lat, :long, :description, :duration, :project_category_id, :testimonial, :testimonial_name, :photo_id, :photo_collection_id)
      end
    end
  end
end
