class BookingsController < ApplicationController
  def index
    @bookings = Booking.all

    render("booking_templates/index.html.erb")
  end
  
  def my_bookings
    @my_bookings = Team.find(current_player.team_id).bookings

    render("booking_templates/my_bookings.html.erb")
  end  
  

  def show
    @booking = Booking.find(params.fetch("id_to_display"))

    render("booking_templates/show.html.erb")
  end

  def new_form
    render("booking_templates/new_form.html.erb")
  end

  def create_row
    @booking = Booking.new

    @booking.status = true
    @booking.field_id = params.fetch("field_id")
    @booking.timeslot_id = params.fetch("timeslot_id")
    @booking.team_id = params.fetch("team_id")

    if @booking.valid?
      @booking.save

      redirect_to("/my_bookings", :notice => "Booking created successfully.")
    else
      render("booking_templates/new_form.html.erb")
    end
  end

  def edit_form
    @booking = Booking.find(params.fetch("prefill_with_id"))

    render("booking_templates/edit_form.html.erb")
  end

  def update_row
    @booking = Booking.find(params.fetch("id_to_modify"))

    @booking.status = params.fetch("status")
    @booking.field_id = params.fetch("field_id")
    @booking.timeslot_id = params.fetch("timeslot_id")
    @booking.team_id = params.fetch("team_id")

    if @booking.valid?
      @booking.save

      redirect_to("/bookings/#{@booking.id}", :notice => "Booking updated successfully.")
    else
      render("booking_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @booking = Booking.find(params.fetch("id_to_remove"))

    @booking.destroy

    redirect_to("/my_bookings", :notice => "Booking deleted successfully.")
  end
end
