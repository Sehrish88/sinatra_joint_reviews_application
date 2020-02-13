class UsersController < ApplicationController
#routes needed for login, purpose is to render login page (form)
  get '/login' do 
    erb :login
  end 

  #job of this route is to recieve the login form, find user, and log user in/create a session
  post '/login' do
    #find and authenticate user, login user and redirect to user's landing page(dashboard) 
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      #log user in and redirect to dashboard/create a session
      session[:user_id] = @user.id #actually whats logging user in 
      puts session
      redirect "users/#{@user.id}"
    else
      #tell user invalid credentials, redirect to login page 
    end

  end 


#routes needed for signup
  get '/signup' do

  end 
  #user show route
  get '/users/:id' do 
    "this will be the user show route"
  end 
end 