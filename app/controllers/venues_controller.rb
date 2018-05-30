class VenuesController < ApplicationController
  def index
    @venues = Venue.all
    
    require 'open-uri'
    
    

    render("venue_templates/index.html.erb")
  end

  def show
    @venue = Venue.find(params.fetch("id_to_display"))
    sumr=0.0
    countr=0.0
    
    @venue.ratings.each do |rating|
      sumr=sumr+rating.rating
      countr=countr+1
    end
    
    @avg_rating=sumr/countr

    render("venue_templates/show.html.erb")
  end

  def new_form
    render("venue_templates/new_form.html.erb")
  end

  def create_row
    @venue = Venue.new

    @venue.name = params.fetch("name")
    @venue.address = params.fetch("address")

    if @venue.valid?
      @venue.save

      redirect_to("/venues", :notice => "Venue created successfully.")
    else
      render("venue_templates/new_form.html.erb")
    end
  end

  def edit_form
    @venue = Venue.find(params.fetch("prefill_with_id"))

    render("venue_templates/edit_form.html.erb")
  end

  def update_row
    @venue = Venue.find(params.fetch("id_to_modify"))

    @venue.name = params.fetch("name")
    @venue.address = params.fetch("address")

    if @venue.valid?
      @venue.save

      redirect_to("/venues/#{@venue.id}", :notice => "Venue updated successfully.")
    else
      render("venue_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @venue = Venue.find(params.fetch("id_to_remove"))

    @venue.destroy

    redirect_to("/venues", :notice => "Venue deleted successfully.")
  end
end
