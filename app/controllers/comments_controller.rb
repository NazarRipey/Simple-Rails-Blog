class CommentsController < ApplicationController
     
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
    end
    
    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])

        if @comment.author == current_user.nickname
            @comment.destroy
        else 
            flash.alert = 'You can delete only your comments!'
        end

        redirect_to article_path(@article)
    end

    private
    def comment_params
        params.require(:comment).permit(:author, :text)
    end
end
