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
            redirect to '/projects/new'
        end
    end

end 