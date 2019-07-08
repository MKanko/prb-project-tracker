class ContractorsController < ApplicationController

    get '/signup' do
        if !logged_in?
            erb :'/contractors/signup'
        else 
            redirect to '/projects'
        end 
    end
    
    post '/signup' do
        if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
            @contractor = Contractor.new(params)
            @contractor.save
            session[:contractor_id] = @contractor.id
            redirect to '/projects'
        else 
            redirect to '/signup'
        end 
    end
    
    get '/login' do
        if !logged_in?
            erb :'/contractors/login'
        else
            redirect to '/projects'
        end 
    end 

    post '/login' do
        @contractor = Contractor.find_by_id(params[:contractor_id])     
        if @contractor && @contractor.authenticate(params[:password])
            session[:contractor_id] = @contractor.id 
            redirect to '/projects'
        else
            redirect to '/login'
        end 
    end
    
end 