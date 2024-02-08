class Customer < ApplicationRecord
  belongs_to :user
  has_many :payments, dependent: :destroy

  validates :subscription_fee, numericality: { greater_than: 0 }, presence: true
  validates_presence_of :subscription_fee, :start_date

  def up_to_date_with_payments?
    start_date = self.start_date
    end_date = Date.today
    required_payments = (end_date.year * 12 + end_date.month) - (start_date.year * 12 + start_date.month) + 1
    self.payments.where("payment_date >= ? AND payment_date <= ?", start_date, end_date).count >= required_payments
  end

  def missing_payments?
    missing_payments = []
    next_payment_date = self.start_date

    while next_payment_date <= Date.today
      # Verifica se existe um pagamento para o mês e ano de next_payment_date
      unless self.payments.where('extract(year from payment_date) = ? AND extract(month from payment_date) = ?', next_payment_date.year, next_payment_date.month).exists?
        missing_payments << next_payment_date
      end
      next_payment_date = next_payment_date.next_month.beginning_of_month
    end

    missing_payments
  end
end
