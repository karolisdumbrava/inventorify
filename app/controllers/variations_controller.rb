class VariationsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_product
    before_action :set_variation, only: [:show, :edit, :update, :destroy]


    def index
        @variations = @product.variations
      end
      

    def show
    end

    def new
        @variation = @product.variations.build
    end

    def create
        @variation = @product.variations.build(variation_params)
        @variation.user = current_user
        if @variation.save
            redirect_to product_variations_path(@product), notice: 'Variation was successfully created.'
        else
            Rails.logger.info @variation.errors.full_messages   
            render :new, status: :unprocessable_entity
        end
    end
    

    def edit
    end

    def update
        if @variation.update(variation_params)
            redirect_to product_variations_path(@product), notice: 'Variation was successfully updated.'
        else
            render :edit
        end
    end

    def destroy
        @variation.destroy
        redirect_to product_variations_path(@product), notice: 'Variation was successfully destroyed.'
    rescue ActiveRecord::RecordNotDestroyed
        redirect_to product_variations_path(@product), notice: 'Variation could not be destroyed.'

    end

    def variation_for_product
        @variations = Product.find(params[:product_id]).variations
        respond_to do |format|
            format.json { render json: @variations }
        end
    end


    private

        def set_product
            @product = current_user.products.find(params[:product_id])
        rescue ActiveRecord::RecordNotFound
            redirect_to products_path, notice: 'Product not found.'
        end

        def set_variation
            @variation = @product.variations.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            redirect_to product_variations_path(@product), notice: 'Variation not found.'
        end

        def variation_params
            params.require(:variation).permit(:model, :storage, :size, :color, :price)   
        end


end
