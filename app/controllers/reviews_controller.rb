class ReviewsController < ApplicationController
  before_filter :logged_in?
  # before_filter :find_post, :only => [:show, :edit, :update, :destroy]

  def create
    # @product = Product.find(review_params[:product_id])
    # review = @product.reviews.create(review_params)
    puts review_params

    review = Review.new(review_params)
    product = Product.find(params[:product_id])
    review.user = current_user
    puts "THIS HAPPENED \n\n"

    puts product

    if review.save
      redirect_to [:products], notice: 'Review posted!'
    else
      redirect_to product
      # render :products
    end
  end

  private

  def logged_in?
    current_user.present?
  end

  def review_params
    # puts "PARAMS"
    # puts params[:product_id]
    # puts params[:product][:reviews][:rating]
    # puts params[:product][:reviews][:description]
    {
     product_id: params[:product_id],
     rating: params[:product][:reviews][:rating],
     description: params[:product][:reviews][:description]
    }
  end

  # def review_params
  #   params.require(:product).permit(
  #     :description,
  #     :rating
  #   )
  # end

end