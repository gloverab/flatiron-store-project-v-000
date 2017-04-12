class LineItemsController < ApplicationController
  belongs_to :cart
  belongs_to :item

end
