class PostsController < ApplicationController

	before_action :set_post!, only: [:show, :edit, :update]

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
		@categories = Category.all
	end

	def create
		post = Post.create(params[:post])
		redirect_to post_path(post)
	end

	def edit
		@post = Post.find(params[:id])
		@categories = Category.all
	end

	def update
		# post = Post.find(params[:id])
		# post.update(params.require(:post))
		# redirect_to post_path(post)
		if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
	end

	private

  def post_params
    params.permit(:title, :category, :content)
  end

  def set_post!
    @post = Post.find(params[:id])
		@categories = Category.all
  end

end
