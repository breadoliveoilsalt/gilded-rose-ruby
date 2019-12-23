require_relative './default_updater.rb'

class BackstagePassUpdater < DefaultUpdater

  def initialize(item)
    @item = item
  end

  def update_item_quality
    if @item.sell_in > 10
      @item.quality = [50, @item.quality + 1].min
    elsif @item.sell_in > 5
      @item.quality = [50, @item.quality + 2].min
    elsif @item.sell_in > 0
      @item.quality = [50, @item.quality + 3].min
    else
      @item.quality = 0
    end
  end

  def update_item_sell_in
    @item.sell_in = @item.sell_in - 1
  end

end