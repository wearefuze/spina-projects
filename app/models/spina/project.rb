module Spina
  class Project < ActiveRecord::Base
    extend FriendlyId
    friendly_id :title, use: [:slugged, :finders]

    belongs_to :project_category, optional: true
    belongs_to :image_collection, optional: true, class_name: "Spina::ImageCollection"
    belongs_to :image, class_name: "Spina::Image"

    accepts_nested_attributes_for :image_collection

    validates :title, :description, :image, :publish_date, presence: true
    validates :slug, uniqueness: true

    scope :by_newest, -> { order(publish_date: :DESC) }
    scope :by_position, -> { order(position: :ASC) }
    scope :is_live, -> { where("publish_date <= ? AND draft = ?", Date.today, 0) }

    def live?
      self.publish_date <= Date.today && draft.zero?
    end

    def scheduled?
      self.publish_date >= Date.today && draft.zero?
    end

    def draft?
      draft == 1
    end
  end
end
