class EventsController < ApplicationController
  expose :event
  expose :topics, from: :event

  def show
  end
end
