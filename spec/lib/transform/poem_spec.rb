require 'rails_helper'

RSpec.describe Transform::Poem do
  describe "Encode and decode" do
    let(:s) { 'hello me name ist Karlsbergunton' }
    let(:urlsafe_set) { /[1234567890qwertyuiopasdfghjklzxcvbnm_.!~*'()=-]/i }
    let(:urlunsafe_set) { /[^1234567890qwertyuiopasdfghjklzxcvbnm_.!~*'()=-]/i }

    it "encodes and decodes correctly" do
      encoded = described_class.encode(s)
      decoded = described_class.decode(encoded)
      expect(decoded).to eq(s)
    end

    it "encodes with url safe symbols" do
      encoded = described_class.encode(s)
      expect(encoded).not_to match(urlunsafe_set)
    end
  end
end
