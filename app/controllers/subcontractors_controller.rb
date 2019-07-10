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
    
    get '/subcontractors/:id' do
        if logged_in?
            @subcontractor = Subcontractor.find_by_id(params[:id])
            erb :'/subcontractors/show'
        else
            redirect to '/login'
        end
    end

    get '/subcontractors/:id/edit' do 
        if logged_in?
            @subcontractor = Subcontractor.find_by_id(params[:id])
             
            #if @subcontractor && @subcontractor.contractor == current_contractor

                erb :'/subcontractors/edit'
            #end 
        else 
            redirect to '/login'
        end  
    end 

    patch '/subcontractors/:id' do       
        @subcontractor = Subcontractor.find_by_id(params[:id])
         
        if params[:name] != "" && params[:trade] != "" && params[:project_name] != "" && 
           params[:status] != "" && params[:payment_status] != ""

           @subcontractor.update(name: params[:name], trade: params[:trade], project_name: params[:project_name],
             status: params[:status], payment_status: params[:payment_status])
             redirect to "/subcontractors/#{@subcontractor.id}"
        else 
            redirect to "/subcontractors/#{@subcontractor.id}/edit"
        end 
    end
    
    delete '/subcontractors/:id/delete' do 
        if logged_in?
            @subcontractor = Subcontractor.find_by_id(params[:id])

            #if @subcontractor && @subcontractor.contractor == current_contractor

                @subcontractor.delete
                redirect '/subcontractors'   
            #end 
        else 
            redirect to '/login'
        end 
    end

end 