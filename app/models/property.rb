class Property < ApplicationRecord
  has_many :stations, dependent: :destroy
  accepts_nested_attributes_for :stations, reject_if: proc {|attributes| attributes['route_name'].blank? and attributes['station_name'].blank? and attributes['time'].blank?}, allow_destroy: true
end