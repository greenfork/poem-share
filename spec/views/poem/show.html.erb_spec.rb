require 'rails_helper'

RSpec.describe "poem/show.html.erb", type: :view do
  describe "rendered" do

    it "is rendered" do
      render
      expect(rendered).to match(/class="poem-view"/)
    end
  end
end
