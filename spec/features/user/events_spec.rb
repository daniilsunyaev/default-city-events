require "rails_helper"

feature "Event page" do
  include_context "current user signed in"

  let!(:event) { create :event, title: "Default city ceremonial renaming" }
  let!(:flame) do
    create :topic,
      name: "Flaming",
      events: [event]
  end

  let!(:flood) do
    create :topic,
      name: "Flood",
      events: [event]
  end

  let!(:mp3) do
    create :topic,
      name: "Download mp3 without registration"
  end

  scenario "User visits event page" do
    visit event_path(event)

    expect(page).to have_content("Default city ceremonial renaming")
    expect(page).to have_content("Flaming")
    expect(page).to have_content("Flood")
    expect(page).not_to have_content("Download mp3 without registration")
  end
end
