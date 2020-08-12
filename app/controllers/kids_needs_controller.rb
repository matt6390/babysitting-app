class KidsNeedsController < ApplicationController
  def index
    @kids_needs = KidsNeed.all

    render "index.json.jbuilder"
  end

  def show
    @kids_need = KidsNeed.find(params[:id])

    render "show.json.jbuilder"
  end

  def create
    @kids_need = KidsNeed.new(
      kid_id: params[:kid_id],
      need_id: params[:need_id]
    )

    if @kids_need.save
      render json: {message: "KidsNeed created successfully"}, status: :created
    else
      render json: {message: @kids_need.errors.full_messages}, status: :bad_request
    end
  end

  def update
    @kids_need = KidsNeed.find(params[:id])

    @kids_need.kid_id = params[:kid_id] || @kids_need.kid_id
    @kids_need.need_id = params[:need_id] || @kids_need.need_id

    if @kids_need.save
      render json: {message: "KidsNeed updated successfully"}, status: :ok
    else
      render json: {message: @kids_need.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    @kids_need = KidsNeed.find(params[:id])
    @kids_need.delete
    render json: {message: "KidsNeed successfully deleted"}, status: :ok
  end
end
