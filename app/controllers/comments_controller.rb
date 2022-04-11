class CommentsController < ApplicationController
    def index
        @article = Article.find(params[:article_id])
        @comments = @article.comments
    end
    def new
        @article = Article.find(params[:article_id])
        @comment = @article.comments.build
    end
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.build(comment_params)

        if @comment.save
            redirect_to article_comments_path(@article.id)

        else
            render :new
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:body)
    end

end
