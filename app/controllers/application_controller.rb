require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret build"
  end

  get "/" do
    erb :home_page
  end

  helpers do
    
    def logged_in?
      !!current_contractor 
    end 

    def current_contractor
      if session[:contractor_id]
        @current_contractor = Contractor.find_by_id(session[:contractor_id]) 
      end 
    end 
  end  


end
