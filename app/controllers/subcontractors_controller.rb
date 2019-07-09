class SubcontractorsController < ApplicationController

    get '/subcontractors' do 
        @subcontractors = Subcontractor.all 
        erb :'/subcontractors/index'
    end 

end 