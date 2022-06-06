class PostsController < ApplicationController

    def show
        @post = Post.find(params[:id])
        render :show
    end

    def new
        @post = Post.new
        render :new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def update
        @post = Post.find(params[:id])

        if @post.update_attributes(post_params)
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :edit
        end
    end

    def edit
        @post = Post.find(params[:id])
        render :edit
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to sub_url(@post.sub)
    end

    def post_params
        params.require(:post).permit(:title, :url, :sub_id, :user_id, :content)
    end
end
