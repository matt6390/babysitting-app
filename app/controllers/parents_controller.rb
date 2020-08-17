class ParentsController < ApplicationController

  def index
    # all parents in system
    @parents = Parent.all
    render "index.json.jbuilder"
  end

  def show
    # show a logged in parents profile
    if current_parent
      @parent = current_parent

      render "show.json.jbuilder"
    else
      render json: {message: "Must Log In"}, status: :unauthorized_user
    end
  end

  def create
    # creating a new parent, like making an account
    @parent = Parent.new(
      first_name: params[:first_name], 
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
      )
    # either saves or throws an error
    if @parent.save
      render json: {message: "Parent created successfully"}, status: :created
    else
      render json: {message: @parent.errors.full_messages}, status: :bad_request
    end
  end

  def update
    # Updates the Logged-In Parent
    @parent = current_parent

    # Basic Info
    @parent.first_name = params[:first_name] || @parent.first_name
    @parent.last_name = params[:last_name] || @parent.last_name
    @parent.email = params[:email] || @parent.email
    @parent.phone_number = params[:phone_number] || @parent.phone_number

    # Password update is attempted if a password has been entered and confirmed by client
    if params[:password] && params[:password_confirmation]
      @parent.password = params[:password] || @parent.password
      @parent.password_confirmation = params[:password_confirmation] || @parent.password_confirmation
    end

    # save the info, or throw error
    if @parent.save
      render json: {message: "Parent updated successfully"}, status: :created
    else
      render json: {message: @parent.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    # delete your account
    @parent = current_parent
    @parent.delete
    render json: {message: "Parent deleted successfully"}, status: :ok
  end
end
