class EventsController < ApplicationController
  expose :events, :fetch_events

  expose :event
  expose :discussions, -> { event.discussions.includes(:topic) }
  expose :filter, id: :filter_id

  def show
  end

  def index
  end

  private

  def fetch_events
    if params[:filter].present?
      filter.new_record? && filter = Filter.new(filter_params)

      Events::FilteredQuery.new(filter: filter).all
    else
      town.events
    end
  end

  def filter_params
    params[:filter].permit(:town_id)
  end
end
