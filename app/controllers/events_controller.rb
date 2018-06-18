class EventsController < ApplicationController
  expose :event
  expose :discussions, -> { event.discussions.includes(:topic) }

  def show
  end
end
