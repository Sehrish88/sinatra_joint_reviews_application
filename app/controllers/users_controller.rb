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
#This route's job is to render the signup form
  get '/signup' do
    erb :signup
  end 

  post '/users' do
    binding.pry
    #This is where we create and persist the new user to the database
    #params will look like this:{"Name"=>"Jeff", "Partner Name"=>"Lizzie", "Email"=>"jeff@bobmail.com", "Password"=>"ohweuf80h3b"}
    if params[:Name] != "" && params[:Partner Name] != "" && params[:Email] != "" && params[:password] != ""
    @user = User.create(params)
    #go to the user show page 
    redirect "/users/#{@user.id}"
  
    else  
      
    end
  end 

  #user show route
  get '/users/:id' do 
    erb :'/users/show'
  end 
end 