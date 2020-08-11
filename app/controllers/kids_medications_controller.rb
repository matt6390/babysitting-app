class KidsMedicationsController < ApplicationController
  def index
    @kids_medications = KidsMedication.all
    render "index.json.jbuilder"
  end
  
  def show
    @kids_medication = KidsMedication.find(params[:id])
    render "shwo.json.jbuilder"  
  end

  def create
    @kids_medication = KidsMedication.new(
      kid_id: params[:kid_id],
      medication_id: params[:medication_id],
      daily_dosage: params[:daily_dosage],
      dose_size: params[:dose_size]
      )  
    if @kids_medication.save
      render json: {message: "KidsMedication created successfully"}, status: :created
    else
      render json: {message: @kids_medication.errors.full_messages}, status: :bad_request
    end
  end

  def update
    @kids_medication = KidsMedication.find(params[:id])

    @kids_medication.kid_id = params[:kid_id] || @kids_medication.kid_id
    @kids_medication.medication_id = params[:medication_id] || @kids_medication.medication_id
    @kids_medication.daily_dosage = params[:daily_dosage] || @kids_medication.daily_dosage
    @kids_medication.dose_size = params[:dose_size] || @kids_medication.dose_size

    if @kids_medication.save
      render json: {message: "KidsMedication created successfully"}, status: :ok
    else
      render json: {message: @kids_medication.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    @kids_medication = KidsMedication.find(params[:id])
    @kids_medication.delete
    render json: {message: "KidsMedication delted successfully"}, status: :ok
  end
end
