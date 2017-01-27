require File.expand_path(File.dirname(__FILE__) + '/base')

class Credit::Standart < Credit::Base

  def obtain
    return unless super

    payment = total/term
    balance = total
    total_percent = 0

    1.upto(term) do |month|
      credit_percent = balance/term*percent/1200*term
      balance -= payment
      total_percent += credit_percent
      @calculations << calculation_per_month(payment, credit_percent, month, balance)
    end

    @calculations << calculation_per_month(total, total_percent)
  end

  private

  def calculation_per_month(payment, percent, month = nil, balance = 0)
    {
      month: month,
      credit_payment: payment.round(2),
      credit_percent: percent.round(2),
      monthly_payment: (percent + payment).round(2),
      credit_balance: balance.round(2)
    }
  end
end