class Itemstable < ActiveRecord::Base
  attr_accessible :price_per_line, :quantity, :item_id
  has_many :items
  belongs_to :order  
end
