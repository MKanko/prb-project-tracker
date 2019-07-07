class Project < ActiveRecord::Base
    belongs_to :contractor 
    belongs_to :sub_contractor 
end 