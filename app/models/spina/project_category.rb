module Spina
  class ProjectCategory < ActiveRecord::Base
    validates :name, presence: true

    has_many :projects
  end
end
