class NotifySubscriberJob < ApplicationJob
  def perform(options)
    @subscriber_id = options[:subscriber_id]
    @filter_ids = options[:filter_ids]
    @event_id = options[:event_id]

    SubscriberMailer.send_subscriber_notification(
      subscriber: subscriber,
      filters: filters,
      event: event
    )
  end

  private

  def subscriber
    User.find(@subscriber_id)
  end

  def filters
    Filter.where(id: @filter_ids)
  end

  def event
    Event.find(@event_id)
  end
end
