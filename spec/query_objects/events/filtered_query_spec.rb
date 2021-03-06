require "rails_helper"

describe Events::FilteredQuery do
  subject(:filtered_events) { described_class.new(query_options).all }

  let(:default_topic) { create :topic, name: "Default topic" }
  let(:custom_topic) { create :topic, name: "Custom topic" }
  let(:town) { create :town, name: "Default city" }
  let!(:default_events) { create_list :event, 2, town: town, topics: [default_topic] }
  let!(:other_events) { create_list :event, 2, topics: [custom_topic, default_topic] }
  let!(:expired_event) { create :event, starts_at: 1.year.ago, town: town }

  context "when no options is provided" do
    let(:query_options) { nil }

    it "returns all events" do
      expect(filtered_events).to eq Event.all
    end
  end

  context "when specific town is provided" do
    let(:query_options) { { town: town } }

    it "returns events associated with town" do
      expect(filtered_events).to match_array(default_events + [expired_event])
    end
  end

  context "when specific topic is provided" do
    let(:query_options) { { topic: default_topic } }

    it "returns events associated with topc" do
      expect(filtered_events).to match_array(default_events + other_events)
    end
  end

  context "when filter is provided" do
    let(:query_options) { { filter: filter } }

    context "when town is specified" do
      let(:filter) { build :filter, town: town }

      it "returns events associated with town" do
        expect(filtered_events).to match_array(default_events + [expired_event])
      end
    end

    context "when town and start time range specified" do
      let(:filter) do
        build :filter,
          town: town,
          min_starts_at: 100.years.ago,
          max_starts_at: 2.days.ago
      end

      it "returns events associated with town" do
        expect(filtered_events).to match_array [expired_event]
      end
    end
  end
end
