require_relative './default_updater.rb'

class ConjuredItemUpdater < DefaultUpdater

  def initialize(item)
    @item = item
  end

  def update_item_quality
    if @item.sell_in > 0
      @item.quality = [0, @item.quality - 2].max
    else
      @item.quality = [0, @item.quality - 4].max
    end
  end

  def update_item_sell_in
    @item.sell_in = @item.sell_in - 1
  end

end