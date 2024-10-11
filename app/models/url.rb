class Url < ApplicationRecord
  validates :original_url, presence: true
  validates :short_url, presence: true
  validates_url_format_of :original_url

  before_validation :assign_short_url, only: :create

  def assign_short_url
    loop do
      self.short_url = Url.generate_short_url
      break unless Url.exists?(short_url: short_url)
    end
  end

  def register_visit
    increment_visits_counter
    save!
  end

  private

  def increment_visits_counter
    self.visits += 1
  end

  def self.generate_short_url
    (("a".."z").to_a + ("A".."Z").to_a).sample
  end
end
