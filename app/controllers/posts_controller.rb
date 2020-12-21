class PostsController < ApplicationController
    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.create(post_params)
      
        if @post.valid?
            redirect_to @post
        else  
            flash[:errors] = @post.errors.full_messages
            render new_post_path
        end 
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        if @post.valid?
            redirect_to @post
        else  
            flash[:errors] = @post.errors.full_messages
            render new_post_path
        end
    end

    def like
        @post = Post.find(params[:id])
        @post.update(likes: @post.increase_like)
        redirect_to post_path(@post)
    end

    private
    def post_params
        params.require(:post).permit(:title, :content, :likes, :destination_id, :blogger_id)
    end
end
