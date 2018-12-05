class PostsController < ApplicationController

    
    def index
        @posts = Post.all.order("created_at DESC")
    end
    
    def new
        @post = Post.new

    end

    def create
    @post = Post.new(post_params)
    
    if @post.save
        redirect_to @post
    else
        render 'new'
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    #this method will update the post
    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end
    end


    #this method will render the view
    def edit
        @post = Post.find(params[:id])
    end

    #this method will delete posts
    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to  posts_path
    end

    def find_post
        @post = Post.find(params[:id])

    end

    private
    
    def post_params
        params.require(:post).permit(:title,:content)
    end
end
