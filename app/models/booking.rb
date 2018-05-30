# == Schema Information
#
# Table name: bookings
#
#  id          :integer          not null, primary key
#  status      :boolean
#  field_id    :integer
#  timeslot_id :integer
#  team_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Booking < ApplicationRecord
    belongs_to :timeslot
    belongs_to :team
    has_one :match, :dependent => :destroy
    belongs_to :field
end
