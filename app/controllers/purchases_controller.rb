class PurchasesController < ApplicationController
  before_action :set_purchase, only: %i[show edit update destroy]

  # GET /purchases or /purchases.json
  def index
    @purchases = Purchase.where(user_id: current_user.id).order(updated_at: :desc)
  end

  # GET /purchases/1 or /purchases/1.json
  def show; end

  def edit; end

  # GET /purchases/new
  def new
    @purchase = Purchase.new
    @user_payment_method = current_user.user_payment_method if current_user.user_payment_method
  end

  # POST /purchases or /purchases.json
  def create
    @purchase = Purchase.new(purchase_params)

    amount = purchase_params[:gem].to_i * 5 * 100
    @purchase.status = Payment::Client.attach_payment_intent(card_params, current_user.user_payment_method,
                                                             amount)[:status]
    @purchase.payment_id = Payment::Client.attach_payment_intent(card_params, current_user.user_payment_method,
                                                                 amount)[:attached_payment_id]
    respond_to do |format|
      if !@purchase.errors.any? && @purchase.save
        format.html do
          redirect_to purchase_url(@purchase), notice: 'Please authorize the transaction to finalize the payment.'
        end
        format.json { render :show, status: :created, location: @purchase }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to purchase_url(@purchase), notice: 'Gems added to your balance' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1 or /purchases/1.json
  def destroy
    @purchase.destroy

    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def purchase_params
    params.require(:purchase).permit(:user_id, :gem, :status)
  end

  def card_params
    params.require(:purchase).permit(:ccn, :cvc, :expm, :expy)
  end
end
