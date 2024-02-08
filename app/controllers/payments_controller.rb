class PaymentsController < ApplicationController
  before_action :set_customer, except: %i[index add_missing_payment]

  def index
    @customers_with_debts = current_user.customers.map do |customer|
      missing_payments = customer.missing_payments?.map do |date|
        { date: date, amount: customer.subscription_fee }
      end

      { customer: customer, missing_payments: missing_payments } unless missing_payments.empty?
    end.compact
  end

  def new
    @payment = @customer.payments.build
  end

  def create
    @payment = @customer.payments.build(payment_params)
    if @payment.save
      redirect_to @customer, notice: 'Payment was successfully created.'
    else
      render :new
    end
  end

  def add_missing_payment
    customer = Customer.find(params[:customer_id])
    @payment = customer.payments.build(payment_date: params[:payment_date], amount: params[:amount])
    if @payment.save
      redirect_back(fallback_location: customer_path(customer), notice: 'Payment was successfully added.')
    else
      redirect_back(fallback_location: customer_path(customer), alert: 'Failed to add payment.')
    end
  end

  private

    def set_customer
      @customer = current_user.customer.find(params[:customer_id])
    end

    def payment_params
      params.require(:payment).permit(:amount, :payment_date)
    end
end
