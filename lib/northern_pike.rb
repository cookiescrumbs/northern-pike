require 'northern_pike/version'

require 'global_convert'
require 'os_map_ref'

module NorthernPike
  def self.os_reference_to_lat_lng(os_ref:, grid_letters: nil)
    ref = grid_letters ? grid_letters + ' ' + os_ref : os_ref
    os_location = OsMapRef::Location.for ref
    location = GlobalConvert::Location.new(
      input: {
        projection: :osgb36,
        lon: os_location.easting.to_i,
        lat: os_location.northing.to_i
      },
      output: {
        projection: :wgs84
      }
    )
    { lat: (location.lat * 180 / Math::PI), lng: (location.lon * 180 / Math::PI) }
  end

  def self.chomp(text:, grid_letters: nil)
    return nil if text.empty?
    text.split("\n").each_slice(3).to_a.map do |a|
      [a[0], a[2], os_reference_to_lat_lng(os_ref: a[1], grid_letters: grid_letters)]
    end
  end
end
