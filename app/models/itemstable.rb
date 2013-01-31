class Itemstable < ActiveRecord::Base
  attr_accessible :price_per_line, :quantity
  has_many :items
end
