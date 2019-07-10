class Project < ActiveRecord::Base
    belongs_to :contractor 
    belongs_to :subcontractor 
end 