class LocationsController < ApplicationController
  def index
    @locations = Location.all

    render "index.json.jbuilder"
  end

  def show
    if current_parent.location
      @location = current_parent.location

      render "show.json.jbuilder"
    else 
      render json: {error: "No Location yet"}, status: :not_found
    end
  end

  def create
    if current_parent
      @location = Location.new(
        address1: params[:address1],
        city: params[:city],
        state: params[:state],
        zip: params[:zip],
        parent_id: current_parent.id
        )
      if @location.save
        render json: {message: "Location created successfully"}, status: :created
      else
        render json: {errors: @location.errors.full_messages}, status: :bad_request
      end
    else
      render json: {message: "Please log in"}, status: :bad_request
    end
  end

  def update
    @location = Location.find(params[:id])

    @location.address1 = params[:address1] || @location.address1
    @location.city = params[:city] || @location.city
    @location.state = params[:state] || @location.state
    @location.zip = params[:zip] || @location.zip
    @location.parent_id = params[:parent_id] || @location.parent_id

    if @location.save
      render json: {message: "Location updated successfully"}, status: :ok
    else
      render json: {errors: @location.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.delete
    render json: {message: "Location successfully deleted"}, status: :ok
  end
end
