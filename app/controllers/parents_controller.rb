class ParentsController < ApplicationController

  def index
    @parents = Parent.all
    render "index.json.jbuilder"
  end

  def show
    @parent = current_parent
    render "show.json.jbuilder"
  end

  def create
    @parent = Parent.new(
      first_name: params[:first_name], 
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      location_id: params[:location_id],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
      )
    if @parent.save
      render json: {message: "Parent created successfully"}, status: :created
    else
      render json: {message: @parent.errors.full_messages}, status: :bad_request
    end
  end

  def update
    @parent = current_parent

    @parent.first_name = params[:first_name] || @parent.first_name
    @parent.last_name = params[:last_name] || @parent.last_name
    @parent.email = params[:email] || @parent.email
    @parent.phone_number = params[:phone_number] || @parent.phone_number
    @parent.location_id = params[:location_id] || @parent.location_id
    @parent.password = params[:password] || @parent.password
    @parent.password_confirmation = params[:password_confirmation] || @parent.password_confirmation

    if @parent.save
      render json: {message: "Parent updated successfully"}, status: :created
    else
      render json: {message: @parent.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    @parent = current_parent
    @parent.delete
    render json: {message: "Parent deleted successfully"}
  end
end
