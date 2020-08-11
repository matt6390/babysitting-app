class KidsAllergiesController < ApplicationController
  def index
    @kids_allergies = KidsAllergies.all
    render "index.json.jbuilder"
  end

  def show
    @kids_allergy = KidsAllergy.find(params[:id])
    render "show.json.jbuilder"
  end

  def create
    @kids_allergy = KidsAllergy.new(
      kid_id: params[:kid_id],
      allergy_id: params[:allergy_id]
      )
    if @kids_allergy.save
      render json: {message: "KidsAllergy created successfully"}, status: :created
    else
      render json: {message: @kids_allergy.errors.full_messages}, status: :bad_request
    end
  end

  def update
    @kids_allergy = KidsAllergy.find(params[:id])

    @kids_allergy.kid_id = params[:kid_id] || @kids_allergy.kid_id
    @kids_allergy.allergy_id = params[:allergy_id] || @kids_allergy.allergy_id

    if @kids_allergy.save
      render json: {message: "KidsAllergy created successfully"}, status: :ok
    else
      render json: {message: @kids_allergy.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    @kids_allergy = KidsAllergy.find(params[:id])
    @kids_allergy.delete
    render json: {message: "KidsAllergy delted successfully"}, status: :ok
  end
end
