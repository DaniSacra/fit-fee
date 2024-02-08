class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update destroy ]

  # GET /customers or /customers.json
  def index
    @customers = current_user.customers.order(name: :asc)
  end

  # GET /customers/1 or /customers/1.json
  def show
    @payments = @customer.payments.order(payment_date: :desc)
  end

  # GET /customers/new
  def new
    @customer = current_user.customers.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers or /customers.json
  def create
    @customer = current_user.customers.build(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to customer_url(@customer), notice: "Customer was successfully created." }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customer_url(@customer), notice: "Customer was successfully updated." }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1 or /customers/1.json
  def destroy
    @customer.destroy!

    respond_to do |format|
      format.html { redirect_to customers_url, notice: "Customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:name, :phone, :subscription_fee, :start_date)
    end
end
