class ProductsController < ApplicationController
  def new
    @product = Product.new(price: "1.00")
  end

  def create
    params[:product][:price] = params[:product][:price].gsub(',', '')
    product_params = params.require(:product).permit([:title, :price, :description])
    @product = Product.new(product_params)
    if @product.save
      render text: "Product added successfully."
    else
      render :new
    end
  end

  def show
    @product = Product.find params[:id]
  end

  def index
    @products = Product.all.order(:id)
  end

  def edit
    @product = Product.find params[:id]
  end

  def update
    product_params = params.require(:product).permit(:title, :price, :description)
    @product = Product.find params[:id]
    if @product.update product_params
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to products_path
  end

end
