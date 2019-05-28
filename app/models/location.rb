class Location < ApplicationRecord
  validates :name, presence:true
  validates :latitude, presence:true
  validates :longitude, presence:true, numericality: {only_float: true}
  validates :latitude, presence:true, numericality: {only_float: true}
end
