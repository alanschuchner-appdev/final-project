class TeamsController < ApplicationController
  def index
    @teams = Team.all

    render("team_templates/index.html.erb")
  end
  
  def myteam
    @my_team = Team.find(current_player.team_id)

    render("team_templates/my_team.html.erb")
  end
  

  def show
    @team = Team.find(params.fetch("id_to_display"))

    render("team_templates/show.html.erb")
  end

  def new_form
    render("team_templates/new_form.html.erb")
  end

  def create_row
    @team = Team.new

    @team.team_name = params.fetch("team_name")
    @team.logo = params.fetch("logo")
    @team.captain = params.fetch("captain")

    if @team.valid?
      @team.save

      redirect_to("/teams", :notice => "Team created successfully.")
    else
      render("team_templates/new_form.html.erb")
    end
  end

  def edit_form
    @team = Team.find(params.fetch("prefill_with_id"))

    render("team_templates/edit_form.html.erb")
  end

  def update_row
    @team = Team.find(params.fetch("id_to_modify"))

    @team.team_name = params.fetch("team_name")
    @team.logo = params.fetch("logo")
    @team.captain = params.fetch("captain")

    if @team.valid?
      @team.save

      redirect_to("/my_team", :notice => "Team updated successfully.")
    else
      render("team_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @team = Team.find(params.fetch("id_to_remove"))

    @team.destroy

    redirect_to("/teams", :notice => "Team deleted successfully.")
  end
end
