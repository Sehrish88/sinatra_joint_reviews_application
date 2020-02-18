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
    #binding.pry
    #This is where I create and persist the new user to the database
    #params will look like this:{"Name"=>"Jeff", "Partner Name"=>"Lizzie", "Email"=>"jeff@bobmail.com", "Password"=>"ohweuf80h3b"}
    #if params[:name] != "" && params[:partner_name] != "" && params[:email] != "" && params[:password] != ""
    #@user = User.create(params)
    binding.pry
    @user = User.new(name: params["name"])
    @user.partner_name = params["partner_name"]
    @user.email = params["email"]
    @user.password = params["password"]
    @user.save
     binding.pry 
    #go to the user show page 
     redirect "/users/#{@user.id}"
   #else  
    #not valid input
    
    #end
  end 

  #user show route
  get '/users/:id' do 
    erb :'/users/show'
  end 
end 