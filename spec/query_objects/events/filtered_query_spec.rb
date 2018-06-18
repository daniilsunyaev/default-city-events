require "rails_helper"

describe Events::FilteredQuery do
  subject(:filtered_events) { described_class.new(query_options).all }

  let(:town) { create :town, name: "Default city" }
  let!(:default_events) { create_list :event, 2, town: town }
  let!(:other_events) { create_list :event, 2 }

  context "when no options is provided" do
    let(:query_options) { nil }

    it "returns all events" do
      expect(filtered_events).to eq Event.all
    end
  end

  context "when specific town is provided" do
    let(:query_options) { { town: town } }

    it "returns events associated with town" do
      expect(filtered_events).to eq default_events
    end
  end

  context "when filter is provided" do
    let(:filter) { build :filter, town: town }
    let(:query_options) { { filter: filter } }

    it "returns events associated with town" do
      expect(filtered_events).to eq default_events
    end
  end
end
