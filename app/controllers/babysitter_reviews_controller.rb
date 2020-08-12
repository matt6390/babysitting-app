class BabysitterReviewsController < ApplicationController
  def index
    @babysitter_reviews = BabysitterReview.all

    render "index.json.jbuilder"
  end

  def show
    @babysitter_review = BabysitterReview.find(params[:id])

    render "show.json.jbuilder"
  end

  def create
    @babysitter_review = BabysitterReview.new(
      user_id: params[:user_id],
      review_id: params[:review_id]
      )
    if @babysitter_review.save
      render json: {message: "BabysitterReview created successfully"}, status: :created
    else
      render json: {message: @babysitter_review.errors.full_messages}, status: :bad_request
    end
  end

  def update
    @babysitter_review = BabysitterReview.find(params[:id])

    @babysitter_review.user_id = params[:user_id] || @babysitter_review.user_id
    @babysitter_review.review_id = params[:review_id] || @babysitter_review.review_id
    
    if @babysitter_review.save
      render json: {message: "BabysitterReview updated successfully"}, status: :ok
    else
      render json: {message: @babysitter_review.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    @babysitter_review = BabysitterReview.find(params[:id])
    @babysitter_review.delete
    render json: {message: "BabysitterReview successfully deleted"}, status: :ok
  end
end
