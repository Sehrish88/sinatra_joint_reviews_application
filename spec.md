[x] Build an MVC Sinatra application. - I have used Sinatra to build my app using the corneal gem
[x] Use ActiveRecord with Sinatra. - yes active records was used to create my models
[x] Use multiple models. - yes, I have a user model and a review post model
[x] Use at least one has_many relationship on a User model and one belongs_to relationship on another model. - ues a user has many review posts and a review post belongs to a user
[x] Must have user accounts - users must be able to sign up, sign in, and sign out. - yes users can sigh up, sign in, and sign out
[x] Validate uniqueness of user login attribute (username or email). - users are unique based on their email
[x] Once logged in, a user must have the ability to create, read, update and destroy the resource that belongs_to user. - users can create, read, edit, and delete their review post
[x] Ensure that users can edit and delete only their own resources - not resources created by other users. - yes users can only edit and delete their own posts
[x] Validate user input so bad data cannot be persisted to the database. - review posts can only be created if a user is logged in and has input content 
[x] BONUS: Display validation failures to user with error messages. (This is an optional feature, challenge yourself and give it a shot!) - i used flash to give flash messages to users if theyre not logged in to create a review post and if they havent entered proper credentials 