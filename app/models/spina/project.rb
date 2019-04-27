module Spina
  class Project < ActiveRecord::Base
    include FriendlyId

    friendly_id :title, use: :slugged

    belongs_to :project_category, optional: true
    belongs_to :image_collection, optional: true, class_name: 'Spina::ImageCollection'
    belongs_to :image, class_name: 'Spina::Image'

    validates :title, :description, :lat, :long, :image, presence: true
    validates :slug, uniqueness: true
    accepts_nested_attributes_for :image_collection

    scope :newest_first, -> { order('completion_date DESC') }
  end
end
