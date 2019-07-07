class Subcontractor < ActiveRecord::Base
    has_many :projects
    has_many :contractors, through: :projects
end 