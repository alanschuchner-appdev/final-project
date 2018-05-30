Rails.application.routes.draw do
  
  root "venues#index"
  
  # Routes for the Field resource:

  # CREATE
  get("/fields/new", { :controller => "fields", :action => "new_form" })
  post("/create_field", { :controller => "fields", :action => "create_row" })

  # READ
  get("/fields", { :controller => "fields", :action => "index" })
  get("/fields/:id_to_display", { :controller => "fields", :action => "show" })

  # UPDATE
  get("/fields/:prefill_with_id/edit", { :controller => "fields", :action => "edit_form" })
  post("/update_field/:id_to_modify", { :controller => "fields", :action => "update_row" })

  # DELETE
  get("/delete_field/:id_to_remove", { :controller => "fields", :action => "destroy_row" })

  #------------------------------

  # Routes for the Rating resource:

  # CREATE
  get("/ratings/new", { :controller => "ratings", :action => "new_form" })
  post("/create_rating", { :controller => "ratings", :action => "create_row" })

  # READ
  get("/ratings", { :controller => "ratings", :action => "index" })
  get("/ratings/:id_to_display", { :controller => "ratings", :action => "show" })

  # UPDATE
  get("/ratings/:prefill_with_id/edit", { :controller => "ratings", :action => "edit_form" })
  post("/update_rating/:id_to_modify", { :controller => "ratings", :action => "update_row" })

  # DELETE
  get("/delete_rating/:id_to_remove", { :controller => "ratings", :action => "destroy_row" })

  #------------------------------

  # Routes for the Match resource:

  # CREATE
  get("/matches/new", { :controller => "matches", :action => "new_form" })
  post("/create_match", { :controller => "matches", :action => "create_row" })

  # READ
  get("/matches", { :controller => "matches", :action => "index" })
  get("/matches/:id_to_display", { :controller => "matches", :action => "show" })
  get("/my_matches", { :controller => "matches", :action => "my_matches" })

  # UPDATE
  get("/matches/:prefill_with_id/edit", { :controller => "matches", :action => "edit_form" })
  post("/update_match/:id_to_modify", { :controller => "matches", :action => "update_row" })

  # DELETE
  get("/delete_match/:id_to_remove", { :controller => "matches", :action => "destroy_row" })

  #------------------------------

  # Routes for the Booking resource:

  # CREATE
  get("/bookings/new", { :controller => "bookings", :action => "new_form" })
  post("/create_booking", { :controller => "bookings", :action => "create_row" })

  # READ
  get("/bookings", { :controller => "bookings", :action => "index" })
  get("/bookings/:id_to_display", { :controller => "bookings", :action => "show" })
  get("/my_bookings", { :controller => "bookings", :action => "my_bookings" })
  

  # UPDATE
  get("/bookings/:prefill_with_id/edit", { :controller => "bookings", :action => "edit_form" })
  post("/update_booking/:id_to_modify", { :controller => "bookings", :action => "update_row" })

  # DELETE
  get("/delete_booking/:id_to_remove", { :controller => "bookings", :action => "destroy_row" })

  #------------------------------

  # Routes for the Team resource:

  # CREATE
  get("/teams/new", { :controller => "teams", :action => "new_form" })
  post("/create_team", { :controller => "teams", :action => "create_row" })

  # READ
  get("/teams", { :controller => "teams", :action => "index" })
  get("/teams/:id_to_display", { :controller => "teams", :action => "show" })
  get("/my_team", { :controller => "teams", :action => "myteam" })

  # UPDATE
  get("/teams/:prefill_with_id/edit", { :controller => "teams", :action => "edit_form" })
  post("/update_team/:id_to_modify", { :controller => "teams", :action => "update_row" })

  # DELETE
  get("/delete_team/:id_to_remove", { :controller => "teams", :action => "destroy_row" })

  #------------------------------

  # Routes for the Timeslot resource:

  # CREATE
  get("/timeslots/new", { :controller => "timeslots", :action => "new_form" })
  post("/create_timeslot", { :controller => "timeslots", :action => "create_row" })

  # READ
  get("/timeslots", { :controller => "timeslots", :action => "index" })
  get("/timeslots/:id_to_display", { :controller => "timeslots", :action => "show" })
  get("/timeslots_fields", { :controller => "timeslots", :action => "timeslots_fields" })
  

  # UPDATE
  get("/timeslots/:prefill_with_id/edit", { :controller => "timeslots", :action => "edit_form" })
  post("/update_timeslot/:id_to_modify", { :controller => "timeslots", :action => "update_row" })

  # DELETE
  get("/delete_timeslot/:id_to_remove", { :controller => "timeslots", :action => "destroy_row" })

  #------------------------------

  # Routes for the Venue resource:

  # CREATE
  get("/venues/new", { :controller => "venues", :action => "new_form" })
  post("/create_venue", { :controller => "venues", :action => "create_row" })

  # READ
  get("/venues", { :controller => "venues", :action => "index" })
  get("/venues/:id_to_display", { :controller => "venues", :action => "show" })

  # UPDATE
  get("/venues/:prefill_with_id/edit", { :controller => "venues", :action => "edit_form" })
  post("/update_venue/:id_to_modify", { :controller => "venues", :action => "update_row" })

  # DELETE
  get("/delete_venue/:id_to_remove", { :controller => "venues", :action => "destroy_row" })

  #------------------------------

  devise_for :players
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get("/players", { :controller => "players", :action => "index" })
  get("/players/:id_to_display", { :controller => "players", :action => "show" })
  
  
end
