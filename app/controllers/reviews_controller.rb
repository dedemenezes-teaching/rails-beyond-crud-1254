class ReviewsController < ApplicationController

  def new
    # raise
    # retrieve the parent restaurant for the new review
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    # params #=> {"authenticity_token"=>"[FILTERED]", "review"=>{"content"=>"Very nice! "}, "commit"=>"Create Review", "restaurant_id"=>"6"}
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant #=> INSTANCE OF RESTAURANT CLASS
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
    # raise
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
