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
             
            if Contractor.all.none? { |contractor| params[:username] == contractor.username &&
                params[:email] == contractor.email 
            } 
                @contractor = Contractor.new(params)
                @contractor.save
                session[:contractor_id] = @contractor.id
                redirect to '/projects'
            else
                redirect to '/signup'
            end                    
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
        @contractor = Contractor.find_by(:username => params[:username])       
        if @contractor && @contractor.authenticate(params[:password])
            session[:contractor_id] = @contractor.id 
            redirect to '/projects'
        else
            redirect to '/login'
        end 
    end

    # get '/logout' do
    #     if logged_in?
    #         erb :'/contractors/logout'  
    #     else
    #         redirect to '/login'
    #     end
    # end
 
    post '/logout' do
        if logged_in?
            session.destroy
            redirect to '/'
        else
            redirect to '/login'
        end
    end 
    
end 