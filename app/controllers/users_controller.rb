class UsersController < ApplicationController
#routes needed for login, purpose is to render login page (form)
  get '/login' do 
    erb :login
  end 

  #job of this route is to recieve the login form, find user, and log user in/create a session
  post '/login' do
    #find and authenticate user, login user and redirect to user's landing page(dashboard) 
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      #log user in and redirect to dashboard/create a session
      session[:user_id] = @user.id #actually whats logging user in 
      redirect "users/#{@user.id}"
    else 
      flash[:message] = "Invalid credentials, please enter correct username and password or signup"
      #tell user invalid credentials, redirect to login page 
      redirect '/login' 
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
    if params[:name] != "" && params[:partner_name] != "" && params[:email] != "" && params[:password] != "" &&  User.find_by(email: params[:email]) == nil 
    @user = User.create(params)
    #binding.pry
    #@user = User.create(name: params["name"], partner_name: params["partner_name"], email: params["email"], password: params["password"])
    session[:user_id] = @user.id
   #go to the user show page 
     redirect "/users/#{@user.id}"
    else  
      flash[:message] = "Please enter all credentials in the required fields to create a user"
    redirect '/signup'
    
    end
  end 

  #user show route
  get '/users/:id' do 
    #binding.pry
    @user = User.find_by(id: params[:id])

    erb :'/users/show'
  end 

  get '/logout' do
    session.clear
    redirect '/'
  end 

  get '/home' do
    redirect '/'
  end 

end 