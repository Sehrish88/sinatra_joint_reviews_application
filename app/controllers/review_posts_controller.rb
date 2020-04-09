class ReviewPostsController < ApplicationController

    get 'review_posts' do 
      @review_posts = ReviewPost.all 
      erb :'review_posts/index'
    end 
    #get review_posts/new to render a form to create new review post
    get '/review_posts/new' do
       if logged_in?
        erb :'/review_posts/new'
       else 
        flash[:message] = "You must first login or sign up to create a review post"
        redirect '/login'
       end 
    end 

    #post request to create new review post 
    post '/review_posts' do 
        #raise params.inspect 
      #create new review post and save it to db, but only if it has some content and if user is logged in
       if !logged_in?
        flash[:message] = "Please log in to make a review post"
        redirect '/login'
       end 

       

       if params[:content] != ""
        flash[:message] = "Review post successfully created!"
         @review_post = ReviewPost.create(content: params[:content], user_id: current_user.id )
         #binding.pry 
         redirect "/review_posts/#{@review_post.id}"
       else
        flash[:message] = "Please fill out the content section correctly"
        redirect 'review_posts/new'

       end 
     
    end 
   

    #show page for review entry 
    get '/review_posts/:id' do
     set_review_post
     erb :"/review_posts/show" 
    end 
    
    #this route should send user to review_posts/edit.erb, which should render a review form
    get '/review_posts/:id/edit' do
      set_review_post
      if logged_in?
        if @review_post.user == current_user
      erb :'/review_posts/edit'
        else 
          redirect "users/#{current_user.id}"
        end 
      else 
        redirect '/'
      end 
    end 
   
    #This action finds the review_post and modifies/updates the review_post and then redirects to showpage 
    patch '/review_posts/:id/' do
      set_review_post
      if logged_in?
        if @review_post.user == current_user
        @review_post.update(content: params[:content])
        flash[:message] = "Sucessfuly updated post."
        redirect "review_posts/#{@review_post.id}" 
       else 
        redirect "users/#{current_user.id}"
       end 
      else 
       redirect '/'
      end 
    end 

    delete '/review_posts/:id' do 
      set_review_post
      if @review_post.user == current_user
      @review_post.destroy
      flash[:message] = "Your post was successfully deleted"
      redirect '/review_posts' 
      else 
        redirect '/review_posts'
      end 
    end 

    private 

    def set_review_post
      @review_post = ReviewPost.find(params[:id])
    end 
 
    

end 