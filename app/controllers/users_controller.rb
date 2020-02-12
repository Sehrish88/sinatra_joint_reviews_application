class UsersController < ApplicationController
#routes needed for login, purpose is to render login page (form)
  get '/login' do 
    erb :login
  end 


#routes needed for signup
  get '/signup' do

  end 

end 