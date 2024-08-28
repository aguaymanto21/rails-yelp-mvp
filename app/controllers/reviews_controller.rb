class ReviewsController < ApplicationController
  def new
    # We need @restaurant in our `simple_form_for`
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    # no view needed
    @restaurant = Restaurant.find(params[:restaurant_id]) #obtine cual es el restaurant
    @review = Review.new(review_params) #crea el formulario
    @review.restaurant = @restaurant #acepta el review hacia el restaurant
    @review.save
    redirect_to restaurant_path(@restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
