class CommentsController < ApplicationController
    def create
        @comment = current_user.comments.build(comment_params) #grab current user and build the comment for us, auto associated the user with comment
    end

    private
    def comment_params
        params.require(:comment).permit(:content) #whitelist :content comming through
    end
end
