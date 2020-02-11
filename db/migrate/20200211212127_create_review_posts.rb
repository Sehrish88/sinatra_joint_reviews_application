class CreateReviewPosts < ActiveRecord::Migration
  def change
    create_table :review_posts do |t|
      t.string :content 
      t.integer :user_id 

      t.timestamps null: false
    end
  end
end
