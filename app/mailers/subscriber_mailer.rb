class SubscriberMailer < ApplicationMailer
  def send_subscriber_notification(options)
    @subscriber = options[:subscriber]
    @event = options[:event]
    @filters = options[:filters]
    @filter_names = @filters.map(&:name)

    mail subject: "New Event matching your filter",
      to: @subscriber.email
  end
end
