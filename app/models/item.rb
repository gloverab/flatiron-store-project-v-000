class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items

  def self.available_items
    all.select {|x| x.inventory > 0}
  end

  def money_price
    "$#{self.price.to_f/100}"
  end

end
