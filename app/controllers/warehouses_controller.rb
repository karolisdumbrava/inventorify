class WarehousesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_warehouse, only: [:show, :edit, :update, :destroy]
  
    def index
      @warehouses = current_user.managed_warehouses
    end
  
    def new
      @warehouse = Warehouse.new
    end
  
    def create
      @warehouse = current_user.managed_warehouses.build(warehouse_params)
      if @warehouse.save
        redirect_to warehouses_path, notice: 'Warehouse was successfully created.'
      else
        render :new
      end
    end
  
    def show
    end
  
    def edit
    end
  
    def update
      if @warehouse.update(warehouse_params)
        redirect_to warehouses_path, notice: 'Warehouse was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @warehouse.destroy
      redirect_to warehouses_path, notice: 'Warehouse was successfully destroyed.'
    end
  
    private
  
    def set_warehouse
      @warehouse = current_user.managed_warehouses.find(params[:id])
    end
  
    def warehouse_params
      params.require(:warehouse).permit(:name, :address, :capacity)
    end
  end
  