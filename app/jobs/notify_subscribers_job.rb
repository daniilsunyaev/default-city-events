class NotifySubscribersJob < ApplicationJob
  def perform(options)
    @event_id = options[:event_id]

    filters_id_user_id.group_by(&:user_id).each do |user_id, user_filters|
      NotifySubscriberJob.perform_later(
        subscriber_id: user_id,
        filter_ids: user_filters.map(&:id).sort,
        event_id: @event_id
      )
    end
  end

  private

  def event
    @event ||= Event.find(@event_id)
  end

  def filters_id_user_id
    @filter_ids ||= matching_filters.select(:id, :user_id)
  end

  def matching_filters
    @matching_filters ||= Events::MatchingFiltersQuery.new(event).all
  end
end
