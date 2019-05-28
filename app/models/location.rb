class Location < ApplicationRecord
  validates :longitude, presence:true, numericality: {only_float: true}
  validates :latitude, presence:true, numericality: {only_float: true}
end
