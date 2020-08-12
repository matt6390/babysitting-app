class ReviewsController < ApplicationController
  def index
    @reviews = Review.all

    render "indez.json.jbuilder"
  end

  def show
    @review = Review.find(params[:id])

    render "show.json.jbuilder"
  end
  def create
    @review = Review.new(
      rating: params[:rating],
      text: params[:text]
      )
    if @rating.save
      render json: {message: "Review created successfully"}, status: :created
    else
      render json: {message: @review.errors.full_messages}, status: :bad_request
    end
  end

  def update
    @review = Review.find(params[:id])

    @review.rating = params[:rating] || @review.rating
    @review.text = params[:text] || @review.text
    
    if @rating.save
      render json: {message: "Review updated successfully"}, status: :ok
    else
      render json: {message: @review.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.delete
    render json: {message: "Review successfully deleted"}, status: :ok
  end
end
