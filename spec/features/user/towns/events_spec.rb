require "rails_helper"

feature "List of events in the town" do
  include_context "current user signed in"

  let(:default_city) { create :town, name: "Dafault city" }
  let(:midtown) { create :town, name: "Midtown" }
  let(:topic) { create :topic, name: "Relax" }

  let!(:fishing) do
    create :event,
      title: "Fishing",
      town: midtown,
      topics: [topic]
  end

  let!(:relaxing) do
    create :event,
      title: "Relaxing",
      town: midtown
  end
  let!(:expired_event) do
    create :event,
      title: "October revolution",
      town: midtown,
      starts_at: 100.years.ago
  end
  let!(:concert) { create :event, title: "Mr.Default's concert", town: default_city }
  let!(:birthday) { create :event, title: "Default city birthday", town: default_city }

  scenario "User visits town events page" do
    visit town_events_path(default_city)

    expect(page).not_to have_content("Fishing")
    expect(page).not_to have_content("Relaxing")
    expect(page).to have_content("Mr.Default's concert")
    expect(page).to have_content("Default city birthday")
  end

  scenario "User applies filter to events" do
    visit town_events_path(default_city)

    select "Midtown", from: "Town"
    select "2017", from: "filter_min_starts_at_1i"
    select "2020", from: "filter_max_starts_at_1i"
    select "Relax", from: "Topic"
    click_button "Apply Filter"

    expect(page).to have_content("Fishing")
    expect(page).not_to have_content("Relaxing")
    expect(page).not_to have_content("October revolution")
    expect(page).not_to have_content("Mr.Default's concert")
    expect(page).not_to have_content("Default city birthday")
  end
end
