module Spina
  class ProjectCategory < ActiveRecord::Base
    validates :name, presence: true

    belongs_to :project
  end
end
