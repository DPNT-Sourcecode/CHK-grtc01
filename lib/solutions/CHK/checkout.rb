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
  attr_reader :name, :qty, :free_item, :min_qty
  def initialize(name, qty, free_item, min_qty = qty)
    @name = name
    @qty = qty
    @free_item = free_item
    @min_qty = min_qty
  end
end

class Group
  attr_reader :item_list, :qty, :price
  def initialize(item_list, qty, price)
    @item_list = item_list
    @qty = qty
    @price = price
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
  attr_reader :shop_items, :discounts, :sorted_basket, :freebies, :groups

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
    set_up_groups
  end

  def set_up_prices
    @shop_items = []
    i = Item.new('A',50)
    @shop_items << i
    i = Item.new('B',30)
    @shop_items << i
    i = Item.new('C',20)
    @shop_items << i
    i = Item.new('D',15)
    @shop_items << i
    i = Item.new('E',40)
    @shop_items << i
    i = Item.new('F',10)
    @shop_items << i
    i = Item.new('G',20)
    @shop_items << i
    i = Item.new('H',10)
    @shop_items << i
    i = Item.new('I',35)
    @shop_items << i
    i = Item.new('J',60)
    @shop_items << i
    i = Item.new('K',80)
    @shop_items << i
    i = Item.new('L',90)
    @shop_items << i
    i = Item.new('M',15)
    @shop_items << i
    i = Item.new('N',40)
    @shop_items << i
    i = Item.new('O',10)
    @shop_items << i
    i = Item.new('P',50)
    @shop_items << i
    i = Item.new('Q',30)
    @shop_items << i
    i = Item.new('R',50)
    @shop_items << i
    i = Item.new('S',30)
    @shop_items << i
    i = Item.new('T',20)
    @shop_items << i
    i = Item.new('U',40)
    @shop_items << i
    i = Item.new('V',50)
    @shop_items << i
    i = Item.new('W',20)
    @shop_items << i
    i = Item.new('X',90)
    @shop_items << i
    i = Item.new('Y',10)
    @shop_items << i
    i = Item.new('Z',50)
    @shop_items << i

  end

  def set_up_discounts
    @discounts = []
    d = Discount.new('A',5,200)
    @discounts << d
    d = Discount.new('A',3,130)
    @discounts << d
    d = Discount.new('B',2,45)
    @discounts << d
    d = Discount.new('H',10,80)
    @discounts << d
    d = Discount.new('H',5,45)
    @discounts << d
    d = Discount.new('K',2,150)
    @discounts << d
    d = Discount.new('P',5,200)
    @discounts << d
    d = Discount.new('Q',3,80)
    @discounts << d
    d = Discount.new('V',3,130)
    @discounts << d
    d = Discount.new('V',2,90)
    @discounts << d
  end

  def set_up_freebies
    @freebies = []
    f = Freebie.new('E',2,'B')
    @freebies << f
    f = Freebie.new('F',3,'F',1)
    @freebies << f
    f = Freebie.new('N',3,'M',1)
    @freebies << f
    f = Freebie.new('R',3,'Q',1)
    @freebies << f
    f = Freebie.new('U',4,'U',1)
    @freebies << f
  end

  def set_up_groups
    @groups = []
    group_list = ['S','T','X','Y','Z']
    g = Group.new(group_list,3,45)
    @groups << g
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
    check_groups
    check_freebies
    check_discounts
    add_up_basket
  end

  def check_groups
    @groups.each do |item_list, qty, price|
      qualifying_counter = 0
      @sorted_basket.each do |basket_item|
        if item_list.include?(basket_item.name)
          p 'In group'
        end
      end
    end
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
          eligable(basket_item.qty,freebie.qty,freebie.min_qty)
          no_freebies = basket_item.qty / freebie.qty
          # Need to find the freebie
          make_freebie_free(freebie.free_item,no_freebies)
        end
      end
    end
  end

  def eligable(basket_qty,offer_qty,min_qty)
      basket_qty >= offer_qty &&
      basket_qty >= min_qty
  end

  def make_freebie_free(item, qty)
    @sorted_basket.each do |basket_item|
      if basket_item.name == item
        new_qty = 0
        if basket_item.qty <= qty
           new_qty = qty - basket_item.qty
        elsif basket_item.qty > qty
           new_qty = basket_item.qty - qty
        end
        basket_item.update_quantity(new_qty)
      end
    end
  end

  def add_up_basket
    @total_price = 0
    @sorted_basket.each do |basket_item|
      @total_price += basket_item.qty * basket_item.price
    end
    @total_price
  end
end






