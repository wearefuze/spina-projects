module Spina
  class Project < ActiveRecord::Base
    include FriendlyId

    friendly_id :title, use: :slugged

    belongs_to :project_category, optional: true
    belongs_to :image_collection, optional: true, class_name: 'Spina::ImageCollection'
    belongs_to :image, class_name: 'Spina::Image'

    validates :title, :description, :image, :publish_date, presence: true
    validates :slug, uniqueness: true
    accepts_nested_attributes_for :image_collection

    scope :live, -> { where('publish_date <= ? AND draft = ?', Date.today, 0) }
    scope :newest_first, -> { order('publish_date DESC') }

    def live?
      true if self.publish_date <= Date.today && draft == 0
    end

    def scheduled?
      true if self.publish_date >= Date.today && draft == 0
    end

    def draft?
      draft == 1
    end

    scope :by_position, -> { order('position ASC') }

  end
end
