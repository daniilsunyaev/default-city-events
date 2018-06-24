class EventsController < ApplicationController
  expose :events, :fetch_events

  expose :event
  expose :discussions, -> { event.discussions.includes(:topic) }
  expose :filter, id: -> { params[:filter_id] || params[:filter] && params[:filter][:id] }

  def show
  end

  def index
  end

  private

  def fetch_events
    if params[:filter].present?
      filter.new_record? && self.filter = Filter.new(filter_params)

      Events::FilteredQuery.new(filter: filter).all
    else
      Event.all
    end
  end

  def filter_params
    params[:filter].permit(:town_id, :topic_id, :max_starts_at, :min_starts_at)
  end
end
