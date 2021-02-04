class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"], password: ENV["HTTP_BASIC_PASSWORD"]

  def show
    @products_count = Product.count
    @product_categories_count = Product.distinct.count(:category_id)
  end
end