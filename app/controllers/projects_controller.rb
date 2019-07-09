class ProjectsController < ApplicationController

    get '/projects' do
        if logged_in? 
            @projects = Project.all 
            erb :'/projects/index'
        else 
            redirect to '/login'
        end 
    end
    
    get '/projects/new' do
        if logged_in?
            erb :'/projects/new'
        else
            redirect to '/login'
        end
    end
 
    post '/projects' do
        if params[:name] != ""
            @project = Project.new(params)
            @project.contractor = current_contractor
            @project.save
            redirect to "/projects/#{@project.id}"
        else
            @error = "A project must have a name."
            erb :'/projects/new' 
        end
    end

    get '/projects/:id' do                     # read/view a specific project 
        if logged_in?  
            @project = Project.find_by_id(params[:id]) 
            erb :'/projects/show'   
        else 
            redirect to '/login'
        end 
    end

    get '/projects/:id/edit' do 
        if logged_in?
            @project = Project.find_by_id(params[:id])
            if @project && @project.contractor == current_contractor
                erb :'/projects/edit'
            end 
        else
            redirect to '/login' 
        end 
    end
    
    patch '/projects/:id' do
        @project = Project.find_by_id(params[:id])
        if params[:name] != "" && params[:project_scope] != "" && params[:total_cost] != ""
        params[:sub_cost] != "" && params[:subcontractors] != "" && params[:status] != ""
        params[:billing_status] !="" 
            @project.update(name: params[:name], project_scope: params[:project_scope], 
            total_cost: params[:total_cost], sub_cost: params[:sub_cost], 
            subcontractors: params[:subcontractors], status: params[:status],
            billing_status: params[:billing_status])
            redirect to "/projects/#{@project.id}"  
        else
            redirect to "/projects/#{@project.id}/edit"
        end 
    end 

    delete '/projects/:id/delete' do 
        if logged_in?
            @project = Project.find_by_id(params[:id])
            if @project && @project.contractor == current_contractor
                @project.delete
                redirect '/projects'  
            end 
        else 
            redirect to '/login'
        end 
    end 

end 