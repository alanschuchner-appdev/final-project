# == Schema Information
#
# Table name: matches
#
#  id            :integer          not null, primary key
#  home_score    :integer
#  visitor_score :integer
#  booking_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Match < ApplicationRecord
    belongs_to :booking
    has_one :organizer_team, :through => :booking, :source => :team
end
