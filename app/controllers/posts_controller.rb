class PostsController < ApplicationController
  before_action  :author_user ,{only: [:new ,:edit ,:create ,:update]}

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
    if params[:image_url] != nil
      image_url = MiniMagick::Image.read(params[:image_url])
      image_url.resize_to_fill "128,128"
      image_url.write "public/images/hoge.jpg"
    end

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

  def author_user
    if session[:user_id].to_i >= 1
    else
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category, :image_url)
  end

end
