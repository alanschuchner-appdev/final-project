# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  rating     :float
#  player_id  :integer
#  venue_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rating < ApplicationRecord

    belongs_to :player
    belongs_to :venue

    
end
