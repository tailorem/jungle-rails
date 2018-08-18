class ReviewsController < ApplicationController

  def create
    review = Review.new(review_params)
    # review = Product.review.create(review_params)
    review.user = current_user
    puts "THIS HAPPENED \n\n"

    puts review_params[product_id]

    if review.save
      redirect_to [:products], notice: 'Review posted!'
    else
      redirect_to [:products], notice: 'Review posted!'
      # render :products
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :product_id,
      :user_id,
      :description,
      :rating
    )
  end

end