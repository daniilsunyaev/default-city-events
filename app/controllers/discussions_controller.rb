class DiscussionsController < ApplicationController
  expose :discussion
  expose :comments, -> { discussion.comments.includes(:user) }

  def show
  end
end
