class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def  new
    @reviews = Review.new
  end
end
