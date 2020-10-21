def stock_picker(stocks)
  max_profit = 0
  day_to_buy = nil
  day_to_sell = nil
  stocks.each_with_index do |stock_1, idx|
    stocks.each_with_index do |stock_2, idy|      
      if (stock_2 - stock_1) >= max_profit && idy>idx
        max_profit = stock_2 - stock_1        
        day_to_buy = idx
        day_to_sell = idy
      end
    end
  end  
  result = [day_to_buy, day_to_sell]
  return result
end

p stock_picker([17,3,6,9,15,8,6,1,10])