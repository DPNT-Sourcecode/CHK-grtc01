# noinspection RubyUnusedLocalVariable
class Checkout
  attr_reader :item_prices, :special_offers, :total_price, :sorted_basket
  ITEM = 2
  ITEM.freeze
  PRICE = 1
  PRICE.freeze
  QTY = 0
  QTY.freeze
  SPECIAL_OFFER_CODE = 'SO'
  SPECIAL_OFFER_CODE.freeze

  def checkout(skus)
    set_up
    return -1 unless check_valid(skus)

    sort_basket(skus)
    check_specials
    add_up_basket
  end

  def set_up
    @item_prices = { 'A' => 50, 'B' => 30, 'C' => 20, 'D' => 15, 'E' => 40 }
    @special_offers = { 'A' => [5, 200],'A' => [3, 130], 'B' => [2, 45] }
    @total_price = 0
    @sorted_basket = []
  end

  def check_valid(basket)
    basket_valid = true
    x = 0
    while basket_valid && (x < basket.chars.length)
      if !@item_prices.include?(basket.chars[x])
        basket_valid = false
      end
      x += 1
    end
    basket_valid
  end

  def sort_basket(basket)
    basic_items(basket)
    check_specials
  end

  def basic_items(basket)
    @item_prices.each do |item, price|
      item_array = []
      item_array[ITEM] = item
      item_array[QTY] = basket.chars.count(item)
      item_array[PRICE] = price
      @sorted_basket << item_array
    end
  end

  def check_specials
    x = 0
    while x < @sorted_basket.length &&
      @sorted_basket[x][ITEM] != 'SO'
      get_special_offer(x)
      x += 1
    end
  end

  def get_special_offer(num)
    item = @sorted_basket[num][ITEM]
    qty = @sorted_basket[num][QTY]

    if @special_offers.include?(item) &&
      qty >= @special_offers[item][QTY]
      offer_item = []
      x = qty.div(@special_offers[item][QTY])
      offer_item[ITEM] = SPECIAL_OFFER_CODE
      offer_item[PRICE] = @special_offers[item][PRICE]
      offer_item[QTY] = x
      @sorted_basket << offer_item
      @sorted_basket[num][QTY] = qty % @special_offers[item][QTY]
    end
  end

  def add_up_basket
    x = 0
    while x < @sorted_basket.length
      @total_price += @sorted_basket[x][QTY] * @sorted_basket[x][PRICE]
      x += 1
    end
    @total_price
  end
end






