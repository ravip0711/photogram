class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Your post has been created."
      redirect_to @post
    else
      flash.now[:alert] = "Error: you need an image to post."
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Post successfully updated."
      redirect_to(post_path(@post))
    else
      flash.now[:error] = "Error with form inputs."
      render :show
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.delete
    flash[:success] = "Post deleted."
    redirect_to(posts_path)
  end


  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

end
