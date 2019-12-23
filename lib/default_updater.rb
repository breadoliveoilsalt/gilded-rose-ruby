class DefaultUpdater

  def initialize(item)
    @item = item
  end

  def update_item_quality
    if @item.sell_in > 0
      @item.quality = [0, @item.quality - 1].max
    else
      @item.quality = [0, @item.quality - 2].max
    end
  end

  def update_item_sell_in
    @item.sell_in = @item.sell_in - 1
  end

end