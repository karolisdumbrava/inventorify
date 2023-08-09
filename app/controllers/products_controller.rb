class ProductsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_product, only: [:show, :edit, :update, :destroy]

    def index
        @products = current_user.products
    end
    
    def show
    end

    def new
        @product = Product.new
    end

    def create
        @product = current_user.products.build(product_params)
        if @product.save
            redirect_to products_path, notice: 'Product was successfully created.'
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @product.update(product_params)
            redirect_to products_path, notice: 'Product was successfully updated.'
        else
            render :edit
        end
    end

    def destroy
        @product.destroy
        redirect_to products_path, notice: 'Product was successfully destroyed.'
    rescue ActiveRecord::RecordNotDestroyed
        redirect_to products_path, notice: 'Product could not be destroyed.'
    end

    def variation_for_product
        product = Product.find(params[:id])
        @variations = product.variations
        respond_to do |format|
            format.json { render json: @variations }
        end
    end


    private
        def set_product
            @product = current_user.products.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            redirect_to products_path, notice: 'Product not found.'
        end

        def product_params
            params.require(:product).permit(:name, :description)
        end
end
