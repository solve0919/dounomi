class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts = Post.order(created_at: :desc).limit(3)
  end

  def d_backnumber
    @posts = Post.all
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post= Post.new
  end

  def create
    
    @post = Post.new(post_params)
    if @post.save
    flash[:notice] = "記事を投稿しました。"
    redirect_to("/")
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
    redirect_to("/")
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to("/")
  end

  def post_params
    params.require(:post).permit(:title, :body, :category, :image_url)
  end

end
