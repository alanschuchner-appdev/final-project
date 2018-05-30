class FieldsController < ApplicationController
  def index
    @fields = Field.all

    render("field_templates/index.html.erb")
  end

  def show
    @field = Field.find(params.fetch("id_to_display"))

    render("field_templates/show.html.erb")
  end

  def new_form
    render("field_templates/new_form.html.erb")
  end

  def create_row
    @field = Field.new

    @field.venue_id = params.fetch("venue_id")
    @field.name = params.fetch("name")
    @field.price = params.fetch("price")
    @field.capacity = params.fetch("capacity")

    if @field.valid?
      @field.save

      redirect_to("/fields", :notice => "Field created successfully.")
    else
      render("field_templates/new_form.html.erb")
    end
  end

  def edit_form
    @field = Field.find(params.fetch("prefill_with_id"))

    render("field_templates/edit_form.html.erb")
  end

  def update_row
    @field = Field.find(params.fetch("id_to_modify"))

    @field.venue_id = params.fetch("venue_id")
    @field.name = params.fetch("name")
    @field.price = params.fetch("price")
    @field.capacity = params.fetch("capacity")

    if @field.valid?
      @field.save

      redirect_to("/fields/#{@field.id}", :notice => "Field updated successfully.")
    else
      render("field_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @field = Field.find(params.fetch("id_to_remove"))

    @field.destroy

    redirect_to("/fields", :notice => "Field deleted successfully.")
  end
end
