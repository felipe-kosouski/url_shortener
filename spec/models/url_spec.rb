require 'rails_helper'

RSpec.describe Url, type: :model do
  describe '#validations' do
    it 'validates presence of original_url' do
      url = Url.new(original_url: nil)
      expect(url).not_to be_valid
      expect(url.errors[:original_url]).to include("can't be blank")
    end

    it 'validates presence of short_url' do
      url = Url.new(short_url: nil)
      expect(url).not_to be_valid
      expect(url.errors[:short_url]).to include("can't be blank")
    end

    it 'validates format of original_url' do
      valid_url = Url.new(original_url: "https://test.com", short_url: "A")
      invalid_url = Url.new(original_url: "foo", short_url: "A")

      expect(valid_url).to be_valid
      expect(invalid_url).not_to be_valid
    end
  end

  describe '#assign_short_url' do
    it 'assigns a short url correctly' do
      url = Url.new(original_url: "https://google.com")
      url.assign_short_url
      expect(url.short_url).not_to be_empty
      expect(url.short_url.length).to eq(1)
    end
  end
end
