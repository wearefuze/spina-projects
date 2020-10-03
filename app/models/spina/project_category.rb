module Spina
  class ProjectCategory < ActiveRecord::Base
    has_many :projects

    validates :name, presence: true
  end
end
