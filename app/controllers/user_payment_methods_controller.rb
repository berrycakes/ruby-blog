class UserPaymentMethodsController < ApplicationController
  before_action :set_user_payment_method, only: %i[ show edit update destroy ]
  before_action :set_purchase, only: %i[ create update ]

  # GET /user_payment_methods/new
  def new
    @user_payment_method = UserPaymentMethod.new
  end

  # GET /user_payment_methods/1/edit
  def edit
  end

  # POST /user_payment_methods or /user_payment_methods.json
  def create
    @user_payment_method = UserPaymentMethod.new(user_payment_method_params)

    respond_to do |format|
      if @user_payment_method.save
        format.html { redirect_to new_purchase_url(@purchase), notice: "User payment method was successfully created." }
        format.json { render :edit, status: :created, location: @purchase }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_payment_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_payment_methods/1 or /user_payment_methods/1.json
  def update
    respond_to do |format|
      if @user_payment_method.update(user_payment_method_params)
        format.html { redirect_to new_purchase_url(@purchase), notice: "User payment method was successfully updated." }
        format.json { render :edit, status: :ok, location: @user_payment_method }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_payment_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_payment_methods/1 or /user_payment_methods/1.json
  def destroy
    @user_payment_method.destroy

    respond_to do |format|
      format.html { redirect_to user_payment_methods_url, notice: "User payment method was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_payment_method
      @user_payment_method = current_user.user_payment_method
    end

    def set_purchase
      @purchase = Purchase.new
    end

    # Only allow a list of trusted parameters through.
    def user_payment_method_params
      params.require(:user_payment_method).permit(:user_id, :name, :email, :phone, :line1, :line2, :city, :state, :postal_code, :country)
    end
end
