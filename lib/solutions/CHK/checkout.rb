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
    add_up_basket
  end

  def set_up
    @item_prices = { 'A' => 50, 'B' => 30, 'C' => 20, 'D' => 15, 'E' => 40 }
    @special_offers = { 'A' => [[5, 200],[3, 130]], 'B' => [[2, 45]] }
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
      item_array[QTY] = basket.chars.count(item)
      if item_array[QTY] > 0
        item_array[ITEM] = item
        item_array[PRICE] = price
        @sorted_basket << item_array
      end
    end
  end

  def check_specials
    x = 0
    p @sorted_basket.length
    p @sorted_basket
    while x < @sorted_basket.length &&
      @sorted_basket[x][ITEM] != 'SO'
      print 'in check specials, checking '
      p @sorted_basket[x]
      if @special_offers.include?(@sorted_basket[x][ITEM])
        calc_all_special_offers(x)
      end
      x += 1
    end
  end

# By now I should have an item and a list of special offers
  def calc_all_special_offers(num)
    print ' In calc_all_special_offers'
    p @sorted_basket[num]
    p item = @sorted_basket[num][ITEM]
    p offers_list = @special_offers[item]
    # x = 0
    # while x < offers_list.length
    # if @special_offers.include?(item)
    #   calc_special(num,offers_list[x])
    # end
  end

  def calc_special(num,special_offers_list)
    x = 0
    while x < special_offers_list.length do
      update_basket(num,special_offers_list[x])
    end
  end

  def update_basket(num, special_offer)
    p 'in update basket'
    p num
    p special_offers
    qty = @sorted_basket[num][QTY]
    offer_item = []
    x = qty.divmod(special_offers[QTY])
    p 'x is ' + x
    offer_item[ITEM] = SPECIAL_OFFER_CODE
    offer_item[PRICE] = special_offers[PRICE]
    offer_item[QTY] = x[0]
    @sorted_basket << offer_item
    @sorted_basket[num][QTY] = x[1]
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
