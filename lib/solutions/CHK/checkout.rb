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
    p skus
    basket_array = skus.chars
    item_array = []
    x = 0
    while x < @item_prices.length do

      item_array[0] = @item_prices[x]
      item_array[1] = basket_array.count(item_array[0])
      @sorted_basket << item_array
      x = x + 1
      p item_array
      p @sorted_basket
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
