# == Schema Information
#
# Table name: venues
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Venue < ApplicationRecord
    
    has_many :ratings, :dependent => :destroy
    has_many :fields, :dependent => :destroy
    has_many :player_ratings, :through => :ratings, :source => :player
    
    validates :name, presence: true
    validates :name, uniqueness: true
    
end
