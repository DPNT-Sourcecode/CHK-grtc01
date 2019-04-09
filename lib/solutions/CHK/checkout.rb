# noinspection RubyUnusedLocalVariable
class Checkout

  attr_reader :item_prices, :special_offers, :total_price, :sorted_basket

  def checkout(skus)
    set_up
    if !check_valid(skus)
      return -1
    end
    sort_basket(skus)
    check_specials
    add_up_basket
    @total_price
  end
  def set_up
    @item_prices = { 'A' => 50, 'B' => 30, 'C' => 20, 'D' => 15 }
    @special_offers = { 'A' => [3,130], 'B' => [2,45]}
    @total_price = 0
    @sorted_basket = []
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
    @sorted_basket.each do | item, qty, price |
      @total_price += (qty * price)
    end
    @total_price
  end

  def check_offers(item, qty)
    p offer  = @special_offers[item]
    1
  end
end

