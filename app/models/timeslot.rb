# == Schema Information
#
# Table name: timeslots
#
#  id         :integer          not null, primary key
#  slot_time  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Timeslot < ApplicationRecord
    has_many :bookings, :dependent => :destroy
    has_many :fields_reserved, :through => :bookings, :source => :field
end
