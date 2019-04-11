# noinspection RubyUnusedLocalVariable
class Item
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

class BasketItem < Item
  attr_reader :qty
  def initialize(name, price, qty)
    @name = name
    @price = price
    @qty = qty
  end
  def update_quantity(new_qty)
    @qty = new_qty
  end
end

class Discount
  attr_reader :name, :qty, :price
  def initialize(name, qty, price)
    @name = name
    @qty = qty
    @price = price
  end
end

class Freebie
  attr_reader :name, :qty, :free_item
  def initialize(name, qty, free_item)
    @name = name
    @qty = qty
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
    calculate_total
    add_up_basket
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
  end

  def set_up_discounts
    @discounts = []
    d1 = Discount.new('A',5,200)
    d2 = Discount.new('A',3,130)
    d3 = Discount.new('B',2,45)
    @discounts << d1
    @discounts << d2
    @discounts << d3
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
    found = false
    @shop_items.each do |shop_item|
      if item == shop_item.name
        found = true
      end
    end
    found
  end

  # KM Not happy about this looping unnecessarily - revisit
  def sort_basket(basket)
    @sorted_basket = []
    @shop_items.each do |shop_item|
      basket_qty = basket.chars.count(shop_item.name)
      if basket_qty > 0
        basket_item = BasketItem.new(shop_item.name,shop_item.price,basket_qty)
        @sorted_basket << basket_item
      end
    end
  end

  def calculate_total
    check_discounts
    check_freebies
    add_up_basket
  end

  def check_discounts
    specials = []
    @sorted_basket.each do |basket_item|
      @discounts.each do |discount|
        if basket_item.name == discount.name &&
          basket_item.qty >= discount.qty
          offer_qty = basket_item.qty / discount.qty
          remainder = basket_item.qty % discount.qty
          special_offer_item = BasketItem.new(basket_item.name,discount.price,offer_qty)
          specials << special_offer_item
          basket_item.update_quantity(remainder)
        end
      end
    end
    @sorted_basket += specials
  end

  def check_freebies
    @sorted_basket.each do |basket_item|
      @freebies.each do |freebie|
        if basket_item.name == freebie.name &&
          basket_item.qty >= freebie.qty
          no_freebies = basket_item.qty / freebie.qty
          # Need to find the freebie
          make_freebie_free(freebie.free_item,no_freebies )
        end
      end
    end
  end

  def make_freebie_free(item, qty)
    @sorted_basket.each do |basket_item|
      if basket_item.name == item && qty >= basket_item.qty
        new_qty = 0
        if basket_item.qty > qty
           new_qty = basket_item.qty - qty
        elsif basket_item.qty > qty
           new_qty = qty - basket_item.qty
        end
        basket_item.update_quantity(new_qty)
      end
    end
  end

  def add_up_basket
    p sorted_basket
    @total_price = 0
    @sorted_basket.each do |basket_item|
      @total_price += basket_item.qty * basket_item.price
    end
    @total_price
  end
end
