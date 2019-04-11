# noinspection RubyUnusedLocalVariable
class Item
  attr_reader :name, :price
  def initialize(name, price)
    @name = name
    @price = price
  end
end

class Discount
  attr_reader :item, :qualifying_qty, :new_price
  def initialize(item, qty, price)
    @item = item
    @qualifying_qty = qty
    @new_price = price
  end
end

class Freebie
  attr_reader :item, :qualifying_qty, :free_item
  def initialize(item, qty, free_item)
    @item = item
    @qualifying_qty = qty
    @free_item = free_item
  end
end

class Basket
  attr_reader :items, :total
  def initialize()
    @items = []
    @total = 0
  end
  def fill_basket(items)
    @items = items
  end
end

class Checkout
  attr_reader :shop_items, :discounts, :sorted_basket

  def checkout(skus)
    set_up_shop
    return -1 unless check_valid(skus)

    sort_basket(skus)
    # add_up_basket
  end

  def set_up_shop
    set_up_prices
    set_up_discounts
    set_up_freebies
  end

  def set_up_prices
    @shop_items = []
    a = Item.new('A',50)
    b = Item.new('B',30)
    c = Item.new('C',20)
    d = Item.new('D',15)
    e = Item.new('E',40)
    @shop_items << a
    @shop_items << b
    @shop_items << c
    @shop_items << d
    @shop_items << e
    p @shop_items
  end

  def set_up_discounts
    @discounts = []
    d1 = Discount.new('A',3,130)
    d2 = Discount.new('A',5,200)
    d3 = Discount.new('B',2,45)
    @discounts << d1
    @discounts << d2
    @discounts << d3
    p @discounts
  end

  def set_up_freebies
    @freebies = []
    f1 = Freebie.new('E',2,'B')
    @freebies << f1
  end

  def check_valid(basket)
    basket_valid = true
    x = 0
    while basket_valid && (x < basket.chars.length)
      basket_valid = check_item_valid(basket.chars[x])
      x += 1
    end
    basket_valid
  end

  def check_item_valid(item)

    p item
  end

  def sort_basket(basket)
    @shop_items.each do |item|
      if basket.chars.count(item) > 0
        item_array = []
        item_array[0] = item
        item_array[1] = basket.chars.count(item)
        @sorted_basket << item_array
      end
      p @sorted_basket
    end
  end
  #
  # def check_specials
  #   check_freebies
  #   check_discounts
  # end
  #
  # def check_freebies
  #   x = 0
  #   @sorted_basket.length
  #   while x < @sorted_basket.length &&
  #     @sorted_basket[x][ITEM] != 'SO'
  #     if @freebies.include?(@sorted_basket[x][ITEM])
  #       calc_freebies(x)
  #     end
  #     x += 1
  #   end
  # end
  #
  # def check_discounts
  #   x = 0
  #   @sorted_basket.length
  #   while x < @sorted_basket.length &&
  #     @sorted_basket[x][ITEM] != 'SO'
  #     if @discounts.include?(@sorted_basket[x][ITEM])
  #       calc_discounts(x)
  #     end
  #     x += 1
  #   end
  # end
  #
  # def calc_freebies(num)
  #   print '  calc_freebies '
  #   p @sorted_basket[num]
  #   item = @sorted_basket[num][ITEM]
  #   print ' freebie   '
  #   p @freebies[item]
  #   if @freebies[item][QTY] >= @sorted_basket[num][QTY]
  #     check_freebie_in_basket(@freebies[item][FREEBIE],@sorted_basket[num])
  #   end
  # end
  #
  # def check_freebie_in_basket(freebie,basket)
  #   print '     in check_freebie_in_basket '
  #   p freebie
  #   p basket
  #   x = 0
  #   while x < @sorted_basket.length
  #     if @sorted_basket[x].include?(freebie)
  #       update_basket_with_freebie(x)
  #     end
  #     x += 1
  #   end
  # end
  #
  # def update_basket_with_freebie(x)
  # end
  #
  # def calc_discounts(num)
  #   item = @sorted_basket[num][ITEM]
  #   offers_list = @discounts[item]
  #   x = 0
  #   while x < offers_list.length
  #     if @sorted_basket[num][QTY] >= offers_list[x][QTY]
  #       update_basket(num, offers_list[x])
  #     end
  #     x += 1
  #   end
  # end
  #
  # def update_basket(num, special_offer)
  #   print '     In update_basket '
  #   p special_offer
  #   qty = @sorted_basket[num][QTY]
  #   offer_item = []
  #   x = qty / special_offer[QTY]
  #   y = qty % special_offer[QTY]
  #   offer_item[ITEM] = SPECIAL_OFFER_CODE
  #   offer_item[PRICE] = special_offer[PRICE]
  #   offer_item[QTY] = x
  #   @sorted_basket << offer_item
  #   @sorted_basket[num][QTY] = y
  #   p @sorted_basket
  # end
  #
  # def add_up_basket
  #   x = 0
  #   while x < @sorted_basket.length
  #     @total_price += @sorted_basket[x][QTY] * @sorted_basket[x][PRICE]
  #     x += 1
  #   end
  #   @total_price
  # end
end








