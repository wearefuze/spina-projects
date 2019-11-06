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
        params[:order].each do |key, value|
          Project.find(value[:id]).update(position: value[:position])
        end

        head :ok
      end

      def categories
        @categories = Spina::ProjectCategory.all
      end

      def categories_update
        if params[:categories].present?
          params[:categories].each do |key, value|
            category = Spina::ProjectCategory.find_by_name(value[:category_name])
            Spina::ProjectCategory.create(name: value[:category_name]) if category.blank?
            category.destroy if value[:category_remove] == "true"
          end
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

      def project_params
        params.require(:project).permit(
          :seo_title,
          :seo_description,
          :title,
          :slug,
          :description,
          :location,
          :duration,
          :completion_date,
          :project_category_id,
          :draft,
          :publish_date,
          :testimonial,
          :testimonial_name,
          :image_id,
          :image_collection_id,
          image_collection_attributes: [:image_tokens, :image_positions]
        )
      end
    end
  end
end
