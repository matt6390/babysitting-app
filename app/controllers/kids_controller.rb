class KidsController < ApplicationController
  def index
    @kids = Kid.all
    render "index.json.jbuilder"
  end

  def show
    @kid = Kid.find(params[:id])
    render "show.json.jbuilder"
  end

  def create
    # Kids can only be added when a parent is logged in
    if current_parent
      @kid = Kid.new(
        first_name: params[:first_name],
        age: params[:age],
        # parent_id: params[:parent_id]
        parent_id: current_parent.id
        )
      # Saves or throws an error
      if @kid.save
        render "show.json.jbuilder", status: :created
      else
        render json: {message: @kid.errors.full_messages}, status: :bad_request
      end
    else  #parent not logged in
      render json: {message: "Please log into parent account"}, status: :unprocessable_entity
    end
  end

  def update
    @kid = Kid.find(params[:id])

    @kid.first_name = params[:first_name] || @kid.first_name
    @kid.age = params[:age] || @kid.age


    if @kid.save
      render json: {message: "Kid updated successfully"}, status: :created
    else
      render json: {message: @kid.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    @kid = Kid.find(params[:id])
    @kid.delete
    render json: {message: "Kid deleted successfully"}
  end
end
