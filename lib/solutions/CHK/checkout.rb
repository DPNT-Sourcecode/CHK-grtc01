# noinspection RubyUnusedLocalVariable
class Checkout

  attr_reader :item_prices, :special_offers, :total_price, :sorted_basket

  def checkout(skus)
    @item_prices = { 'A' => 50, 'B' => 30, 'C' => 20, 'D' => 15, :default => -1}
    @special_offers = { 'A' => [3,130], 'B' => [2,45]}
    @total_price = 0
    @sorted_basket = []
    if !check_valid(skus)
      p 'basket invalid'
      return -1
    end
    # add_up_basket(sort_basket(skus))
    sort_basket(skus)
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
    end
  end
  def add_up_basket(basket_array)
    x = 0
    while x < basket_array.length do
      @total_price += add_item(basket_array[x][0], basket_array[x][1])
      x = x + 1
    end
    total_price
  end
  def add_item(item, qty)
    if item == 'A'
      price_A * qty
    elsif item == 'B'
      price_B * qty
    elsif item == 'C'
      price_C * qty
    elsif item == 'D'
      price_D * qty
    end
  end
  # def get_special_offers(basket_array)
  #   x = 0
  #   while x < basket_array.length do
  #     item_array = []
  #     item_arraybasket_array[x][0]
  #     x = x + 1
  #   end    if item == 'A' && qty == 3
  #     130
  #   end
  # end
end


