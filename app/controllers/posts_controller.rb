class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: %i[ show edit update destroy ]
  

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end


  # GET /posts/1 or /posts/1.json
  def show
    @post_like_exists = PostLike.where(post: @post, user: current_user) == [] ? false : true
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
  end

  # GET /posts/1/edit
  def edit
    if (user_signed_in? && (current_user.id == @post.user_id) || current_user.is_admin == true)
      
    else
      render 'accounterror'
    end
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    if (user_signed_in? && (current_user.id == @post.user_id) || current_user.is_admin == true)
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to @post, notice: "Post was successfully updated." }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
      
    else
      render 'accounterror'
    end

  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    if (user_signed_in? && (current_user.id == @post.user_id) || current_user.is_admin == true)
      @post.destroy
      respond_to do |format|
        format.html { redirect_to posts_url, notice: "Post was successfully deleted." }
        format.json { head :no_content }
      end
    else
      render 'accounterror'
      
    end
  end

  def askexpert
    @post = current_user.posts.build
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
        @post = Post.find(params[:id])
      rescue StandardError 
        redirect_to root_path
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :channel_id)
    end
end
