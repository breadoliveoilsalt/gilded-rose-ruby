module ItemUpdateStrategies

  class DefaultStrategy

    def update(item)
      if item.sell_in > 0
        item.quality = [0, item.quality - 1].max
      else
        item.quality = [0, item.quality - 2].max
      end
      item.sell_in = item.sell_in - 1
    end

  end

  class SulfurasStragegy

    def update(item)
    end

  end

  class BrieStrategy
    
    def update(item)
      if item.sell_in > 0
        item.quality = [50, item.quality + 1].min
      else
        item.quality = [50, item.quality + 2].min
      end
      item.sell_in = item.sell_in - 1
    end

  end

  class BackstagePassStrategy

    def update(item)
      if item.sell_in > 10
        item.quality = [50, item.quality + 1].min
      elsif item.sell_in > 5
        item.quality = [50, item.quality + 2].min
      elsif item.sell_in > 0
        item.quality = [50, item.quality + 3].min
      else
        item.quality = 0
      end
      item.sell_in = item.sell_in - 1
    end

  end

  class ConjuredItemStragegy
    
    def update(item)
      if item.sell_in > 0
        item.quality = [0, item.quality - 2].max
      else
        item.quality = [0, item.quality - 4].max
      end
      item.sell_in = item.sell_in - 1
    end

  end

end
