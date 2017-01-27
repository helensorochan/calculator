require 'spec_helper'

describe Credit::Annuity do
  it 'should do annuity calculations' do
    credit = Credit::Annuity.new(total: 2000,
                                 percent: 18,
                                 term: 3,
                                 type: 'annuity')
    credit.obtain
    result = [{ month: 1,
                credit_payment: 656.77,
                credit_percent: 30.0,
                monthly_payment: 686.77,
                credit_balance: 1343.23 },
              { month: 2,
                credit_payment: 666.62,
                credit_percent: 20.15,
                monthly_payment: 686.77,
                credit_balance: 676.62 },
              { month: 3,
                credit_payment: 676.62,
                credit_percent: 10.15,
                monthly_payment: 686.77,
                credit_balance: 0.0 },
              { month: nil,
                credit_payment: 2000.0,
                credit_percent: 60.3,
                monthly_payment: 2060.3,
                credit_balance: 0.0 }]
    expect(credit.calculations).to eq(result)
  end
end