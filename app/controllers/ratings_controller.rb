class RatingsController < ApplicationController
  def index
    @ratings = Rating.all

    render("rating_templates/index.html.erb")
  end

  def show
    @rating = Rating.find(params.fetch("id_to_display"))

    render("rating_templates/show.html.erb")
  end

  def new_form
    @player_rating=params.fetch("player_id")
    @venue_rating=params.fetch("venue_id")
    
    
    
    render("rating_templates/new_form.html.erb")
  end

  def create_row
    @rating = Rating.new

    @rating.rating = params.fetch("rating")
    @rating.player_id = params.fetch("player_id")
    @rating.venue_id = params.fetch("venue_id")

    if @rating.valid?
      @rating.save

      redirect_to("/venues/#{@rating.venue_id}", :notice => "Rating created successfully.")
    else
      render("rating_templates/new_form.html.erb")
    end
  end

  def edit_form
    @rating = Rating.find(params.fetch("prefill_with_id"))

    render("rating_templates/edit_form.html.erb")
  end

  def update_row
    @rating = Rating.find(params.fetch("id_to_modify"))

    @rating.rating = params.fetch("rating")
    @rating.player_id = params.fetch("player_id")
    @rating.venue_id = params.fetch("venue_id")

    if @rating.valid?
      @rating.save

      redirect_to("/ratings/#{@rating.id}", :notice => "Rating updated successfully.")
    else
      render("rating_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @rating = Rating.find(params.fetch("id_to_remove"))

    @rating.destroy

    redirect_to("/ratings", :notice => "Rating deleted successfully.")
  end
end
