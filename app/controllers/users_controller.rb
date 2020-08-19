class UsersController < ApplicationController
  def index
    @users = User.all

    render "index.json.jbuilder"
  end

  def show
    if current_user
      @user = current_user

      render "show.json.jbuilder"
    else
      render json: {message: "Must Log In"}, status: :unauthorized_user
    end
  end

  def create
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
      )
    if @user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: @user.errors.full_messages}, status: :bad_request
    end
  end

  def update
    @user = current_user

    @user.name = params[:name] || @user.name
    @user.email = params[:email] || @user.email
    @user.password = params[:password] || @user.password
    @user.password_confirmation = params[:password_confirmation] || @user.password_confirmation

    if @user.save
      render "show.json.jbuilder"
    else
      render json: {errors: @user.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    @user = current_user
    @user.delete
    render json: {message: "User deleted"}, status: :ok
  end
end


