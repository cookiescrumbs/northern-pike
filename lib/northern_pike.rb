# frozen_string_literal: true

require 'northern_pike/version'

require 'global_convert'
require 'os_map_ref'

module NorthernPike
  def self.os_ref_to_lat_lng(os_ref:)
    os_location = OsMapRef::Location.for os_ref
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

  def self.lat_lng_to_os_ref(lat:, lng:)
    location = GlobalConvert::Location.new(
      input: {
        projection: :wgs84,
        lon: (Math::PI * lng.to_f / 180),
        lat: (Math::PI * lat.to_f / 180)
      },
      output: {
        projection: :osgb36
      }
    )

    { os_map_ref: OsMapRef::Location.for("#{location.lon},#{location.lat}").map_reference }
  end

  def self.easting_northing_to_lat_lng(easting:, northing:)
    location = GlobalConvert::Location.new(
      input: {
        projection: :osgb36,
        lon: easting,
        lat: northing
      },
      output: {
        projection: :wgs84
      }
    )
    { lat: (location.lat * 180 / Math::PI), lng: (location.lon * 180 / Math::PI) }
  end
end
