# == Schema Information
#
# Table name: fields
#
#  id         :integer          not null, primary key
#  venue_id   :integer
#  name       :string
#  price      :float
#  capacity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Field < ApplicationRecord

    belongs_to :venue
    has_many :bookings, :dependent => :destroy
    has_many :time_slot_reservations, :through => :bookings, :source => :timeslot
    
end
