module Spina
  module Admin
    class ProjectsController < AdminController
      before_action :set_breadcrumb
      before_action :set_project, only: [:show, :edit, :update, :destroy]

      layout "spina/admin/admin"

      def show
      end

      def index
        @projects = Project.by_position
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
          redirect_to spina.admin_projects_url
        else
          render :new
        end
      end

      def update
        add_breadcrumb @project.title
        if @project.update_attributes(project_params)
          redirect_to spina.admin_projects_url
        else
          render :edit
        end
      end

      def destroy
        @project.destroy
        redirect_to spina.admin_projects_url
      end

      def sort
        params[:list].each_pair do |parent_pos, parent_node|
          update_project_position(parent_node, parent_pos)
        end
        head :ok
      end

      private

      def set_project
        @project = Project.find(params[:id])
      end

      def set_breadcrumb
        add_breadcrumb "Projects", spina.admin_projects_path
      end

      def update_project_position(project, position)
        Spina::Project.update(project[:id], position: position.to_i + 1)
      end

      def project_params
        params.require(:project).permit(
          :completion_date,
          :description,
          :draft,
          :duration,
          :image_collection_id,
          :image_id,
          :location,
          :project_category_id,
          :publish_date,
          :seo_description,
          :seo_title,
          :slug,
          :testimonial_name,
          :testimonial,
          :title,
          image_collection_attributes: [:image_tokens, :image_positions],
        )
      end
    end
  end
end
