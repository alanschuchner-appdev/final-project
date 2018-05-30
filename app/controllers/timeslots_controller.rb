class TimeslotsController < ApplicationController
  def index
    @timeslots = Timeslot.all

    render("timeslot_templates/index.html.erb")
  end

  def timeslots_fields
    @timeslots=Timeslot.all
    @field_id=params.fetch("field_id")
    @team_id=params.fetch("team_id")

    render("timeslot_templates/timeslots_fields.html.erb")
  end
  

  def show
    @timeslot = Timeslot.find(params.fetch("id_to_display"))

    render("timeslot_templates/show.html.erb")
  end

  def new_form
    render("timeslot_templates/new_form.html.erb")
  end

  def create_row
    @timeslot = Timeslot.new

    @timeslot.slot_time = params.fetch("slot_time")

    if @timeslot.valid?
      @timeslot.save

      redirect_to("/timeslots", :notice => "Timeslot created successfully.")
    else
      render("timeslot_templates/new_form.html.erb")
    end
  end

  def edit_form
    @timeslot = Timeslot.find(params.fetch("prefill_with_id"))

    render("timeslot_templates/edit_form.html.erb")
  end

  def update_row
    @timeslot = Timeslot.find(params.fetch("id_to_modify"))

    @timeslot.slot_time = params.fetch("slot_time")

    if @timeslot.valid?
      @timeslot.save

      redirect_to("/timeslots/#{@timeslot.id}", :notice => "Timeslot updated successfully.")
    else
      render("timeslot_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @timeslot = Timeslot.find(params.fetch("id_to_remove"))

    @timeslot.destroy

    redirect_to("/timeslots", :notice => "Timeslot deleted successfully.")
  end
end
