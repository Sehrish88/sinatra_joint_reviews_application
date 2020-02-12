#here is where I will create some data to work with and test associations 

#create 3 users 

john = User.create(name: "John", partner_name: "Jenny", email: "John@bobmail.com", password: "London12" )
tom = User.create(name: "Tom", partner_name: "Candy", email: "Tom@bobmail.com", password: "Reviews20" )
bob = User.create(name: "Bob", partner_name: "Sarah", email: "Bob@bobmail.com", password: "password" )

ReviewPost.create(content: "Today I went with Jenny to Kebab Haven, the food and service were excellent!", user_id: john.id)
tom.review_posts.create(content: "Cumin India has excellent butter chicken and they season the food just right, my girlfriend Candy loved the samosas.")
bobs_entry = bob.review_posts.build(content: "Panda garden has great egg rolls")
bobs_entry.save 
