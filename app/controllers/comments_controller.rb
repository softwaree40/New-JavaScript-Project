class  CommentsController < ApplicationController
    def index 
        @post = Post.find(params[:post_id])
        @comments = @post.comments
        
        render json: @comments, include:[:post], status:200
    end
    def show
      @comment = Comment.find(params[:id])
      render json: @comment,include:[:post], status:200
    end
    def create
        binding.pry
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build(comment_params)
        render json: @comment,include:[:post], status:200
    end
    def update
        @comment = Comment.find(params[:id])
        @comment.update(comment_params)
        render json: @comment,include:[:post], status:200
    end
    def destory
        @comment = Comment.find(params[:id])
        @comment.delete
        render json: {commentId: @comment.id}
    end

    private
    def comments_params

        params.require(:comment).permit(:content,:post_id)
    end
end
