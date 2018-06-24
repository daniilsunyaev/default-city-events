require "rails_helper"

describe NotifySubscriberJob do
  include ActiveJob::TestHelper

  let!(:subscriber) { create :user }
  let!(:filters) { create_list :filter, 3, user: subscriber }
  let!(:event) { create :event }

  describe "#perform_now" do
    subject(:job_call) do
      described_class.perform_now(
        subscriber_id: subscriber.id,
        filter_ids: filters.map(&:id),
        event_id: event.id
      )
    end

    it "sends an email" do
      expect(SubscriberMailer)
        .to receive(:send_subscriber_notification)
        .with(
          subscriber: subscriber,
          filters: filters,
          event: event
        )

      job_call
    end
  end
end
