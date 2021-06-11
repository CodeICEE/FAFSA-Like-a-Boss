class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_comment, only: %i[ show edit update destroy ]

    def create
        # if user_signed_in?
            
                @post = Post.find(params[:post_id])
                @comment = @post.comments.create(params[:comment].permit(:comment))
                @comment.user_id = current_user.id if current_user
                @comment.save
        
                if @comment.save
                    redirect_to post_path(@post)
                else
                    redirect_to root_path
                end 
        # else
        #     render 'logandsign'
        # end
    
    end

    def destroy
        if (user_signed_in? && (current_user.id == @comment.user_id) || (current_user.is_admin == true))
            @post = Post.find(params[:post_id])
            @comment = @post.comments.find(params[:id])
            @comment.destroy 
            redirect_to post_path(@post)
        else
            render 'accounterror'
        end

    end

    def edit
        if (user_signed_in? && (current_user.id == @comment.user_id)|| (current_user.is_admin == true))
            @post = Post.find(params[:post_id])
            @comment = @post.comments.find(params[:id])
        else
            render 'accounterror'
        end
        
    end

    def update
        if (user_signed_in? && (current_user.id == @comment.user_id)|| (current_user.is_admin == true))
            @post = Post.find(params[:post_id])
            @comment = @post.comments.find(params[:id])
    
            if @comment.update(params[:comment].permit(:comment))
                redirect_to post_path(@post)
            else
                render 'edit'
            end
        else
            render 'accounterror'
        end



    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
    end
    
end

