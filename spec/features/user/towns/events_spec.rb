require "rails_helper"

feature "List of events in the town" do
  include_context "current user signed in"

  let(:town) { create :town }
  let!(:fishing) { create :event, title: "Fishing" }
  let!(:concert) { create :event, title: "Mr.Default's concert", town: town }
  let!(:birthday) { create :event, title: "Default town birthday", town: town }

  scenario "User visits town events page" do
    visit town_events_path(town)

    expect(page).not_to have_content("Fishing")
    expect(page).to have_content("Mr.Default's concert")
    expect(page).to have_content("Default town birthday")
  end
end
