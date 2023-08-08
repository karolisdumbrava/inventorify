class Api::V1::WarehousesController < ApplicationController
    
    before_action :authenticate_user!
    before_action :set_warehouse, only: [:show, :edit, :update, :destroy]
    
    def index
        @warehouses = current_user.managed_warehouses
    end
    
    def show 
    end

    def new 
        @warehouse = Warehouse.new
    end

    def create
        @warehouse = current_user.managed_warehouses.build(warehouse_params)
        if @warehouse.save
            render json: @warehouse, status: :created
        else
            render json: @warehouse.errors, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @warehouse.update(warehouse_params)
            redirect_to warehouses_path, notice: "Warehouse updated successfully"
        else
            render :edit
        end
    end

    def destroy
        @warehouse.destroy
        redirect_to warehouses_path, notice: "Warehouse deleted successfully"
    end

    private
 
    def warehouse_params
        params.require(:warehouse).permit(:name, :address, :capacity)
    end

    def set_warehouse
        @warehouse = current_user.managed_warehouses.find(params[:id])
    end

end
