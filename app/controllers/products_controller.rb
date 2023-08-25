class ProductsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_product, only: [:show, :edit, :update, :destroy]

    def index
        if params[:query].present?
            @products = current_user.products.search_by_name(params[:query])
            respond_to do |format|
                format.html # regular ERB rendering
                format.json { render json: @products }
            end
        else
            @products = current_user.products
        end
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
        @product.variations.each do |variation|
            variation.inventories.each do |inventory|
                inventory.inventory_transactions.destroy_all
                inventory.destroy
            end
            variation.destroy
        end
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
