class ParentReviewsController < ApplicationController
  def index
    @parent_reviews = ParentReview.all

    render "index.json.jbuilder"
  end

  def show
    @parent_review = ParentReview.find(params[:id])

    render "show.json.jbuilder"
  end

  def create
    @parent_review = ParentReview.new(
      parent_id: params[:parent_id],
      review_id: params[:review_id]
      )
    if @parent_review.save
      render json: {message: "ParentReview created successfully"}, status: :created
    else
      render json: {message: @parent_review.errors.full_messages}, status: :bad_request
    end
  end

  def update
    @parent_review = ParentReview.find(params[:id])

    @parent_review.parent_id = params[:parent_id] || @parent_review.parent_id
    @parent_review.review_id = params[:review_id] || @parent_review.review_id
    
    if @parent_review.save
      render json: {message: "ParentReview updated successfully"}, status: :ok
    else
      render json: {message: @parent_review.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    @parent_review = ParentReview.find(params[:id])
    @parent_review.delete
    render json: {message: "ParentReview successfully deleted"}, status: :ok
  end
end
