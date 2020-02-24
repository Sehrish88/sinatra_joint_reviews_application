class ReviewPostsController < ApplicationController
    #get review_posts/new to render a form to create new review post
    get '/review_posts/new' do
        erb :'/review_posts/new'
    end 

    #post request to create new review post 
    post '/review_posts' do 
        #raise params.inspect 
      #create new review post and save it to db, but only if it has some content and if user is logged in
       if !logged_in?
        redirect '/'
       end 

       

       if params[:content] != ""
         @review_post = ReviewPost.create(content: params[:content], user_id: current_user.id )
         redirect '/review_posts'
       else
        redirect "/review_posts/new/#{review_post.id}"

       end 
     
    end 
   

    #show page for review entry 
    get '/review_posts' do
     @review_posts = ReviewPost.all
     erb :"/review_posts/index" 
    end 
    #index route for all journal entries 
end 