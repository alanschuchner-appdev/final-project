class MatchesController < ApplicationController
  def index
    @matches = Match.all

    render("match_templates/index.html.erb")
  end
  
  def my_matches
    @my_matches = Team.find(current_player.team_id).played_matches

    render("match_templates/my_matches.html.erb")
  end

  def show
    @match = Match.find(params.fetch("id_to_display"))

    render("match_templates/show.html.erb")
  end

  def new_form
    render("match_templates/new_form.html.erb")
  end

  def create_row
    @match = Match.new

    @match.home_score = params.fetch("home_score")
    @match.visitor_score = params.fetch("visitor_score")
    @match.booking_id = params.fetch("booking_id")

    if @match.valid?
      @match.save

      redirect_to("/matches", :notice => "Match created successfully.")
    else
      render("match_templates/new_form.html.erb")
    end
  end

  def edit_form
    @match = Match.find(params.fetch("prefill_with_id"))

    render("match_templates/edit_form.html.erb")
  end

  def update_row
    @match = Match.find(params.fetch("id_to_modify"))

    @match.home_score = params.fetch("home_score")
    @match.visitor_score = params.fetch("visitor_score")
    @match.booking_id = params.fetch("booking_id")

    if @match.valid?
      @match.save

      redirect_to("/matches/#{@match.id}", :notice => "Match updated successfully.")
    else
      render("match_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @match = Match.find(params.fetch("id_to_remove"))

    @match.destroy

    redirect_to("/matches", :notice => "Match deleted successfully.")
  end
end
