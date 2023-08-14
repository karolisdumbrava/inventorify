class InventoryTransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_inventory, only: [:index, :new, :create]

  def index
    @inventory = Inventory.find(params[:inventory_id])
    @transactions = @inventory.inventory_transactions
  end

  def new 
    @transaction = @inventory.inventory_transactions.build
  end

  def create
    @transaction = @inventory.inventory_transactions.build(transaction_params)
    @transaction.user_id = current_user.id

    if @transaction.save
      redirect_to inventory_transactions_path(@inventory), notice: 'Transaction was successfully created.'
    else
      flash[:error] = @transaction.errors.full_messages.join(", ")
      render :new
    end        
  end 

  private

  def set_inventory
    @inventory = Inventory.find(params[:inventory_id])
  end

  def transaction_params
    # Removed :inventory_id since we're building the transaction off the inventory
    params.require(:inventory_transaction).permit(:quantity, :transaction_type, :user_id)
  end

  def adjust_inventory(transaction)
    inventory = transaction.inventory
    if transaction.transaction_type == 'sale'
      inventory.current_quantity -= transaction.quantity
    else
      inventory.current_quantity += transaction.quantity
    end
    inventory.save
  end
end
