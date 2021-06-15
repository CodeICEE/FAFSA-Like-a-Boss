class PostLikesController < ApplicationController
  before_action :authenticate_user!
  
  def update
      post_like = PostLike.where(post: Post.find(params[:post]), user: current_user)
    
        if post_like == []
            #create like
            PostLike.create(post: Post.find(params[:post]), user: current_user)
            @post_like_exists = true
          else
            #delete like
            post_like.destroy_all
            @post_like_exists = false
        end
          respond_to do |format|  
          format.html {}
          format.js 
      end
    end
end
