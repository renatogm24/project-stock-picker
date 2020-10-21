def stock_picker (stocks)
  stocks_by_day = stocks.combination(2).to_a
  p stocks_by_day
  days_and_profits = {}
  highest_profit = []

  stocks_by_day.each do |two_days|
    days_and_profits[two_days] = (two_days[1] - two_days[0])
  end

  p days_and_profits
  highest_profit << stocks.index(days_and_profits.key(days_and_profits.values.max)[0])
  highest_profit << stocks.index(days_and_profits.key(days_and_profits.values.max)[1])

  highest_profit
end

p stock_picker([17,3,6,9,15,8,6,1,10])