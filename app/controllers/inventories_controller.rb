class InventoriesController < ApplicationController

    before_action :authenticate_user!
    before_action :set_inventory, only: [:show, :edit, :update, :destroy]

    def index
        @inventories = Inventory.all
    end

    def show
    end

    def new
        @inventory = Inventory.new
    end

    def create
        @inventory = Inventory.new(inventory_params)
        @inventory.updated_by_user_id = current_user.id
        if @inventory.save
            redirect_to inventories_path, notice: 'Inventory was successfully created.'
        else
            logger.debug @inventory.errors.full_messages.to_sentence
            render :new
        end
    end

    def edit
    end

    def update
        if @inventory.update(inventory_params)
            redirect_to inventories_path, notice: 'Inventory was successfully updated.'
        else
            render :edit
        end
    end

    def destroy
        @inventory.destroy
        redirect_to inventories_path, notice: 'Inventory was successfully destroyed.'
    rescue ActiveRecord::RecordNotDestroyed
        redirect_to inventories_path, notice: 'Inventory could not be destroyed.'

    end

    private
        def set_inventory
            @inventory = Inventory.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            redirect_to inventories_path, notice: 'Inventory not found.'
        end

        def inventory_params
            params.require(:inventory).permit(:product_id, :quantity, :warehouse_id, :variation_id)
        end
end
