require 'spec_helper'

describe Credit::Standart do
  it 'should do standart calculations' do
    credit = Credit::Standart.new(total: 2000,
                                  percent: 18,
                                  term: 3,
                                  type: 'standart')
    credit.obtain
    result = [{ month: 1,
                credit_payment: 666.67,
                credit_percent: 30.0,
                monthly_payment: 696.67,
                credit_balance: 1333.33 },
              { month: 2,
                credit_payment: 666.67,
                credit_percent: 20.0,
                monthly_payment: 686.67,
                credit_balance: 666.67 },
              { month: 3,
                credit_payment: 666.67,
                credit_percent: 10.0,
                monthly_payment: 676.67,
                credit_balance: 0.0 },
              { month: nil,
                credit_payment: 2000.0,
                credit_percent: 60.0,
                monthly_payment: 2060.0,
                credit_balance: 0.0 }]
    expect(credit.calculations).to eq(result)
  end
end