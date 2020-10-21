def stock_picker (stocks)
  stocks_by_day = stocks.combination(2).to_a 
  #combination gives all the combination starting with the left
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
#its wrong!

def stock_picker2(prices)

    best_prices_to_buy_and_sell = [0, 0]

    for i in 0...(prices.length)
        for j in i...(prices.length)
            if (prices[j] - prices[i]) > (best_prices_to_buy_and_sell[1] - best_prices_to_buy_and_sell[0])
                best_prices_to_buy_and_sell = [prices[i], prices[j]]
            end
        end
    end

    return [prices.index(best_prices_to_buy_and_sell[0]), prices.index(best_prices_to_buy_and_sell[1])]
end
#its wrong!

def stock_picker3(stock_values)
  profitable_days = []
  (0..stock_values.length - 2).each do |buy|
    profit_per_day = []
    (buy + 1..stock_values.length - 1).each do |sell|
      buy_day = stock_values[buy]
      sell_day = stock_values[sell]
      profit = sell_day - buy_day
      buy_index = buy
      sell_index = sell
      day_data = [profit, buy_day, sell_day, buy_index, sell_index]
      profit_per_day.push(day_data)
    end

    profit_per_day = profit_per_day.sort_by { |option| option[0] }
    # send the best day to profit per day and remove the first element in stock values
    profitable_days.push(profit_per_day.last)
  end
  profitable_days = profitable_days.sort_by { |day| day[0] }
  # this returns just the values of the buy and sell index days
  profitable_days.last.last(2)
end
#its right!

p stock_picker3([17,15,3,3,6,9,15,8,6,1,10])