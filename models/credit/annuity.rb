require File.expand_path(File.dirname(__FILE__) + '/base')

class Credit::Annuity < Credit::Base

  def obtain
    return unless super

    payment = total*percent/1200/(1 - 1/(1 + percent/1200)**term)
    balance = total
    total_payment = 0

    1.upto(term) do |month|
      credit_percent = balance/term.to_f*percent/1200*term
      credit_payment = payment - credit_percent
      balance -= credit_payment
      total_payment += credit_payment
      @calculations << calculation_per_month(credit_payment, credit_percent, payment, month, balance)
    end

    @calculations << calculation_per_month(total_payment,
                                           payment*term - total_payment,
                                           payment*term)
  end

  private

  def calculation_per_month(payment, percent, monthly_payment, month = nil, balance = 0)
    {
      month: month,
      credit_payment: payment.round(2),
      credit_percent: percent.round(2),
      monthly_payment: monthly_payment.round(2),
      credit_balance: balance.round(2)
    }
  end
end