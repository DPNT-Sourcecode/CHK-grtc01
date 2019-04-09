# noinspection RubyUnusedLocalVariable
class Checkout

  attr_reader :item_prices, :special_offers, :total_price, :sorted_basket

  def checkout(skus)
    @item_prices = { 'A' => 50, 'B' => 30, 'C' => 20, 'D' => 15 }
    @special_offers = { 'A' => [3,130], 'B' => [2,45]}
    @total_price = 0
    @sorted_basket = []
    if !check_valid(skus)
      p 'basket invalid'
      return -1
    end
    # add_up_basket(sort_basket(skus))
    sort_basket(skus)
    add_up_basket
    @total_price
  end

  def check_valid(basket)
    # If the element has no price then its invalid
    basket_valid = true
    basket_array = basket.chars
    x = 0
    while basket_valid && (x < basket_array.length) do
      if !@item_prices.include?(basket_array[x])
        basket_valid = false
      end
      x = x + 1
    end
    basket_valid
  end

  def sort_basket(skus)
    item_array = []
    @item_prices.each do | item, price |
      item_array[0] = item
      item_array[1] = skus.chars.count(item)
      item_array[2] = price
      @sorted_basket << item_array
      item_array = []
    end
  end

  def add_up_basket
    p @sorted_basket
    @sorted_basket.each do | item, qty, price |
      p item
      p qty
      p price

      # remainder = check_offers(item, qty)
      @total_price += qty * price
    end
  end

  def check_offers(item, qty)
    p offer  = @special_offers[item]
    1
  end
end





