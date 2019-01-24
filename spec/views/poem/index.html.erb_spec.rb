require 'rails_helper'

RSpec.describe "poem/index.html.erb", type: :view do
  it 'displays form to submit a poem' do
    render
    expect(rendered).to match(/textarea/)
    expect(rendered).to match(/type="submit"/)
  end
end
