class EventsController < ApplicationController
  expose :event
  expose :disscussion_topics, from: :event

  def show
  end
end
