# noinspection RubyUnusedLocalVariable
class Checkout

  attr_reader :item_prices, :special_offers, :total_price, :sorted_basket
  ITEM = 2
  PRICE = 1
  QTY = 0
  SPECIAL_OFFER_CODE = 'SO'

  def checkout(skus)
    set_up
    if check_valid(skus)
      sort_basket(skus)
      check_specials
      add_up_basket
    else
      return -1
    end
  end

  def set_up
    @item_prices = { 'A' => 50, 'B' => 30, 'C' => 20, 'D' => 15 }
    @special_offers = { 'A' => [3,130], 'B' => [2,45]}
    @total_price = 0
    @sorted_basket = []
  end


  def check_valid(basket)
    basket_valid = true
    x = 0
    while basket_valid && (x < basket.chars.length) do
      if !@item_prices.include?(basket.chars[x])
        basket_valid = false
      end
      x = x + 1
    end
    basket_valid
  end

  def sort_basket(basket)
    basic_items(basket)
    check_specials
  end

  def basic_items(basket)
    @item_prices.each do | item, price |
      item_array = []
      item_array[ITEM] = item
      item_array[QTY] = basket.chars.count(item)
      item_array[PRICE] = price
      @sorted_basket << item_array
    end
  end

  def check_specials
p 1
    x = 0
      p @sorted_basket[x][ITEM]
    while @sorted_basket[x][ITEM] != 'SO' &&
      x < @sorted_basket.length do
        get_special_offer(x)
      x = x+ 1
    end
  end

  def get_special_offer(num)
    item = @sorted_basket[num][ITEM]
    qty = @sorted_basket[num][QTY]
    price = @sorted_basket[num][PRICE]

    if @special_offers.include?(item) &&
      qty >= @special_offers[item][QTY]
      # Add a new element, update the old one
      offer_item = []
      x = qty.div(@special_offers[item][QTY])
      offer_item[ITEM] = SPECIAL_OFFER_CODE
      offer_item[PRICE] = @special_offers[item][PRICE]
      offer_item[QTY] = x
      @sorted_basket << offer_item
      # Update qty of remaining item
      @sorted_basket[num][QTY] = qty.divmod(@special_offers[item][QTY])
      p @sorted_basket
    end
  end

  def add_up_basket
    x = 0
    while x < @sorted_basket.length do
      @total_price += @sorted_basket[x][QTY] * @sorted_basket[x][PRICE]
      x = x+ 1
    end
    @total_price
  end
end



