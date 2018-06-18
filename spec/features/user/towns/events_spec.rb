require "rails_helper"

feature "List of events in the town" do
  include_context "current user signed in"

  let(:default_city) { create :town, name: "Dafault city" }
  let(:midtown) { create :town, name: "Midtown" }
  let!(:fishing) { create :event, title: "Fishing", town: midtown }
  let!(:concert) { create :event, title: "Mr.Default's concert", town: default_city }
  let!(:birthday) { create :event, title: "Default city birthday", town: default_city }

  scenario "User visits town events page" do
    visit town_events_path(default_city)

    expect(page).not_to have_content("Fishing")
    expect(page).to have_content("Mr.Default's concert")
    expect(page).to have_content("Default city birthday")
  end

  scenario "User applies filter to events" do
    visit town_events_path(default_city)

    select "Midtown", from: "Town"
    click_button "Apply Filter"

    expect(page).to have_content("Fishing")
    expect(page).not_to have_content("Mr.Default's concert")
    expect(page).not_to have_content("Default city birthday")
  end
end
