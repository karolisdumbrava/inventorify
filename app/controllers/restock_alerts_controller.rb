class RestockAlertsController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @inventory = Inventory.find(params[:inventory_id])
    @restock_alert = @inventory.restock_alert
  end

  def new
    @inventory = Inventory.find(params[:inventory_id])
    if @inventory.restock_alert 
      redirect_to inventory_restock_alerts_path(@inventory), notice: 'Restock Alert already exists.'
    else 
      @restock_alert = @inventory.build_restock_alert
    end
  end
  

  def create
    @inventory = Inventory.find(params[:inventory_id])
    @restock_alert = @inventory.build_restock_alert(restock_alert_params)
    @restock_alert.assigned_to_user_id = current_user.id

    if @restock_alert.save
      redirect_to inventory_restock_alerts_path(@inventory), notice: 'Restock Alert was successfully created.'
    else
      flash.now[:notice] = 'Restock Alert was not created.'
      puts "error"
      puts @restock_alert.errors.full_messages
      render :new
    end        
  end

  def edit
    @inventory = Inventory.find(params[:inventory_id])
    @restock_alert = @inventory.restock_alert
  end

  def update
    @inventory = Inventory.find(params[:inventory_id])
    @restock_alert = @inventory.restock_alert
    if @restock_alert.update(restock_alert_params)
      redirect_to inventory_restock_alerts_path(@inventory), notice: 'Restock Alert was successfully updated.'
    else
      flash.now[:notice] = 'Restock Alert was not updated.'
      render :edit
    end
  end

  private

  def restock_alert_params
    params.require(:restock_alert).permit(:threshold, :status, :assigned_to_user_id)
  end

  def set_restock_alert
    @restock_alert = RestockAlert.find(params[:id])
  end

end
