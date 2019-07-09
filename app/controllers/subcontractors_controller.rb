class SubcontractorsController < ApplicationController

    get '/subcontractors' do
        if logged_in? 
            @subcontractors = Subcontractor.all 
            erb :'/subcontractors/index'
        else 
            redirect to '/login'
        end 
    end 
   
    get '/subcontractors/new' do
        if logged_in?
            erb :'/subcontractors/new'
        else
            redirect to '/login'
        end 
    end 
    
    post '/subcontractors' do
        if params[:name] != ""
            @subcontractor = Subcontractor.new(params)
            @subcontractor.save
            redirect to "/subcontractors/#{@subcontractor.id}"
        else
            @error = "A subcontractor must have a name."
            erb :'/subcontractors/new' 
        end 
    end 


end 