module Discussions
  class CommentsController < ApplicationController
    expose :discussion
    expose :comment, parent: :discussion

    def create
      comment.save
      respond_with comment, location: discussion_path(discussion)
    end

    private

    def comment_params
      params.require(:comment).permit(:text)
            .merge(user: current_user)
    end
  end
end
