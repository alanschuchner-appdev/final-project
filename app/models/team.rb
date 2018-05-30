# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  team_name  :string
#  logo       :string
#  captain    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Team < ApplicationRecord
    has_many :players, :dependent => :nullify
    has_many :bookings, :dependent => :destroy
    has_many :played_matches, :through => :bookings, :source => :match
    
    
    
end
