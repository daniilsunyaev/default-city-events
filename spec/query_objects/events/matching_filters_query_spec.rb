require "rails_helper"

describe Events::MatchingFiltersQuery do
  subject(:filters_for_event) do
    described_class.new(event).all
  end

  let!(:event) do
    create :event,
      town: matching_town,
      topics: [matching_topic1, matching_topic2],
      starts_at: 1.day.ago
  end

  let(:matching_town) { create :town }
  let(:unmatching_town) { create :town }
  let(:matching_topic1) { create :topic }
  let(:matching_topic2) { create :topic }
  let(:unrelated_topic) { create :topic }
  let!(:matching_filter1) do
    create :filter, topic: matching_topic1, town: matching_town
  end
  let!(:matching_filter2) do
    create :filter, topic: matching_topic2, town: nil
  end
  let!(:matching_filter3) do
    create :filter, topic: nil, town: matching_town
  end
  let!(:matching_filter4) do
    create :filter,
      topic: nil,
      town: matching_town,
      min_starts_at: 2.days.ago,
      max_starts_at: 1.day.since
  end
  let!(:unmatching_filter1) do
    create :filter, topic: matching_topic1, town: unmatching_town
  end
  let!(:unmatching_filter2) do
    create :filter, topic: unrelated_topic, town: matching_town
  end
  let!(:unmatching_filter3) do
    create :filter, topic: nil, town: unmatching_town
  end
  let!(:unmatching_filter4) do
    create :filter,
      topic: nil,
      town: matching_town,
      min_starts_at: 3.days.ago,
      max_starts_at: 2.days.ago
  end

  it "returns list of matching filters for event" do
    expect(filters_for_event).to match_array [
      matching_filter1,
      matching_filter2,
      matching_filter3,
      matching_filter4
    ]
  end
end
