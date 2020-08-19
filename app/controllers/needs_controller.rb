class NeedsController < ApplicationController
  def index
    @needs = Need.all

    render "index.json.jbuilder"
  end

  def show
    @need = Need.find(params[:id])

    render "show.json.jbuilder"
  end

  def create
    @need = Need.new(
      name: params[:name],
      description: params[:description]
      )
    if @need.save
      render json: {message: "Need created successfully"}, status: :created
    else
      render json: {message: @need.errors.full_messages}, status: :bad_request
    end
  end

  def update
    @need = Need.find(params[:id])

    @need.name = params[:name] || @need.name
    @need.description = params[:description] || @need.description

    if @need.save
      render json: {message: "Need updated successfully"}, status: :ok
    else
      render json: {message: @need.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    @need = Need.find(params[:id])
    @need.delete
    render json: {message: "Need successfully deleted"}, status: :ok
  end
end
