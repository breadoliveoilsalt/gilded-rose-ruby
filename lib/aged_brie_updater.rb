require_relative './default_updater.rb'

class AgedBrieUpdater < DefaultUpdater

  def initialize(item)
    @item = item
  end

  def update_item_quality
    if @item.sell_in > 0
      @item.quality = [50, @item.quality + 1].min
    else
      @item.quality = [50, @item.quality + 2].min
    end
  end

  def update_item_sell_in
    @item.sell_in = @item.sell_in - 1
  end

end
