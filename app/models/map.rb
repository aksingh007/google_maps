class Map < ActiveRecord::Base
  geocoded_by :address do |object, results|
    if results.present?
      object.latitude = results.first.latitude
      object.longitude = results.first.longitude
    else
      object.latitude = nil
      object.longitude = nil
    end
  end

  before_validation :geocode, if: :address_changed?

  validates :address, presence: true
  validates :title, presence: true
  validate :found_address_presence

  def found_address_presence
    if latitude.blank? || longitude.blank?
      errors.add(:address, ": We couldn't find the address in google maps")
    end
  end
end
