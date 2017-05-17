class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def create
    @review = Review.new(review_params)

    @review.stripclub = Stripclub.find(params[:stripclub_id])

    if @review.save
      redirect_to stripclub_path(@review.stripclub)
    else
      @stripclub = @review.stripclub
      render "stripclubs/show"
    end

  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
