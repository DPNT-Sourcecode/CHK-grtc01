# noinspection RubyUnusedLocalVariable
class Checkout

  attr_reader :item_prices, :special_offers, :total_price, :sorted_basket

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
      item_array[0] = item
      item_array[1] = basket.chars.count(item)
      item_array[2] = price
      @sorted_basket << item_array
    end
  end

  def check_specials
    p @sorted_basket
    @sorted_basket.each do | item, qty, price |
      if @special_offers.include?(item) &&
        qty >= @special_offers[item][0]
          qty = add_special(qty, price,
            @special_offers[item][0], @special_offers[item][1])
      end
    end
  end

  def add_special(qty, price, spe_qty, spe_price)
    # Add a new element, update the old one
    x = qty.divmod(spe_qty)
    offer_item = ['SO',x[0],spe_price]
    @sorted_basket << offer_item
    x[1]
  end

  def add_up_basket
    p @sorted_basket
    @sorted_basket.each do | item, qty, price |
      @total_price += (qty * price)
    end
    @total_price
  end
end




