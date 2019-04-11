# noinspection RubyUnusedLocalVariable
class Checkout
  attr_reader :item_prices, :discounts, :freebies, :total_price, :sorted_basket
  ITEM = 2
  ITEM.freeze
  PRICE = 1
  PRICE.freeze
  QTY = 0
  QTY.freeze
  FREEBIE = 3
  FREEBIE.freeze
  SPECIAL_OFFER_CODE = 'SO'
  SPECIAL_OFFER_CODE.freeze
  FREEBIE_CODE = -1
  FREEBIE_CODE.freeze

  def checkout(skus)
    set_up
    return -1 unless check_valid(skus)

    sort_basket(skus)
    add_up_basket
  end

  def set_up
    @item_prices = { 'A' => 50, 'B' => 30, 'C' => 20, 'D' => 15, 'E' => 40 }
    @discounts = { 'A' => [[5, 200],[3, 130]],
                        'B' => [[2, 45]]}
    @freebies = {'E' => [2,FREEBIE_CODE,'B'] }

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
    check_freebies
    check_discounts
  end

  def check_freebies
    x = 0
    @sorted_basket.length
    while x < @sorted_basket.length &&
      @sorted_basket[x][ITEM] != 'SO'
      print 'in check freebies, checking '
      p @sorted_basket[x]
      if @freebies.include?(@sorted_basket[x][ITEM])
        calc_freebies(x)
      end
      x += 1
    end
  end

  def check_discounts
    x = 0
    @sorted_basket.length
    while x < @sorted_basket.length &&
      @sorted_basket[x][ITEM] != 'SO'
      print 'in check specials, checking '
      p @sorted_basket[x]
      if @discounts.include?(@sorted_basket[x][ITEM])
        calc_discounts(x)
      end
      x += 1
    end
  end

  def check_freebies(num)
    p ' check_freebies'
  end

  def calc_discounts(num)
    print ' In calc_discounts '
    p num
    p @sorted_basket[num]
    item = @sorted_basket[num][ITEM]
    print 'Item is '
    p item
    offers_list = @discounts[item]
    p offers_list
    x = 0
    while x < offers_list.length
      if @sorted_basket[num][QTY] >= offers_list[x][QTY]
        update_basket(num, offers_list[x])
      end
      x += 1
    end
  end

  def update_basket(num, special_offer)
    p 'in update basket'
    p num
    p special_offer
    qty = @sorted_basket[num][QTY]
    print 'quantity is '
    p qty
    offer_item = []
    x = qty / special_offer[QTY]
    y = qty % special_offer[QTY]
    offer_item[ITEM] = SPECIAL_OFFER_CODE
    offer_item[PRICE] = special_offer[PRICE]
    offer_item[QTY] = x
    @sorted_basket << offer_item
    @sorted_basket[num][QTY] = y
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



