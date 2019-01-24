require 'rails_helper'

RSpec.feature "Viewing poem by the provided link", type: :feature do
  context "with the right base64 hash provided as a url parameter" do

    let(:hash) { 'RFJFQU0NCg0KSXQgd2FzIGEgZHJlYW0gSSBuZXZlciBoYWQ7DQpJdCB3YXMgYSBkYXJrIGdyaW0gZGVhdGggYWhlYWQsDQpBIGJpdCBvZiBjb2xvcnMsIG5pY2UgYW5kIGJsb29tLA0KSSB3YWtlIHVwIHN3ZWF0aW5nLCBhZnRlcm5vb24u' }
    let(:poem) { "DREAMIt was a dream I never had;It was a dark grim death ahead,A bit of colors, nice and bloom,I wake up sweating, afternoon."}

    scenario "should display the poem and its link" do
      visit poem_show_path(hash: hash)
      expect(page).to have_content(poem)
      expect(page).to have_content(poem_show_url(hash: hash))
    end
  end
end
