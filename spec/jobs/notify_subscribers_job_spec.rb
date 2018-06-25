require "rails_helper"

describe NotifySubscribersJob do
  include ActiveJob::TestHelper

  let!(:ivan) { create :user }
  let!(:petr) { create :user }
  let!(:vasya) { create :user }

  let!(:ivan_filters) { create_list :filter, 2, user: ivan }
  let!(:petr_filters) { create_list :filter, 2, user: petr }
  let!(:vasya_filters) { create_list :filter, 2, user: vasya }

  let(:matching_filters_ids) do
    ivan_filters.pluck(:id).push(vasya_filters.first.id)
  end

  let(:event) { create :event }

  describe "#perform_now" do
    subject(:job_call) do
      described_class.perform_now(event_id: event.id)
    end

    before do
      allow(Events::MatchingFiltersQuery)
        .to receive(:new).with(event) { matching_filters }
    end

    let(:matching_filters) do
      instance_double "Events::MatchingFiltersQuery",
        all: Filter.where(id: matching_filters_ids)
    end

    it "sends an email to all subscriber with matching filters" do
      expect(NotifySubscriberJob)
        .to receive(:perform_later)
        .with(
          subscriber_id: ivan.id,
          filter_ids: ivan_filters.map(&:id).sort,
          event_id: event.id
        )
      expect(NotifySubscriberJob)
        .to receive(:perform_later)
        .with(
          subscriber_id: vasya.id,
          filter_ids: [vasya_filters.first.id],
          event_id: event.id
        )

      job_call
    end
  end
end
