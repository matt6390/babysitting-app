class MedicationsController < ApplicationController
  def index
    @medications = Medication.all
    render "index.json.jbuilder"
  end

  def show
    @medication = Medciation.find(params[:id])
    render "show.json.jbuilder"
  end

  def create
    @medication = Medication.new(
      name: params[:name],
      description: params[:description]
      )
    if @medication.save
      render json: {message: "Medication create successfully"}, status: :created
    else
      render json: {message: @medication.errors.full_messages}, status: :bad_request
    end
  end

  def update
    @medication = Medication.find(params[:id])

    @medication.name = params[:name] || @medication.name
    @medication.description = params[:description] || @medication.description
    
    if @medication.save
      render json: {message: "Medication updated successfully"}, status: :ok
    else
      render json: {message: @medication.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    @medication = Medication.find(params[:id])
    @medication.delete
    render json: {message: "Medication removed successfully"}, status: :ok
  end
end
