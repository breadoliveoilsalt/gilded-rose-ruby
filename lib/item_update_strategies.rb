module ItemUpdateStrategies

  class DefaultStrategy

    def update(item)
      item.sell_in = item.sell_in - 1
      return if item.quality <= 0
      item.quality = item.quality - 1 if item.quality > 0
      item.quality = item.quality - 1 if item.quality > 0 && item.sell_in < 0
    end

  end

  class SulfurasStrategy

    def update(item)
    end

  end

  class AgedBrieStrategy
    
    def update(item)
      item.sell_in = item.sell_in - 1
      return if item.quality >= 50
      item.quality = item.quality + 1 if item.quality < 50
      item.quality = item.quality + 1 if item.quality < 50 && item.sell_in < 0
    end

  end

  class BackstagePassStrategy

    def update(item)
      item.sell_in = item.sell_in - 1
      if item.sell_in >= 10
        item.quality = [50, item.quality + 1].min
      elsif item.sell_in >= 5
        item.quality = [50, item.quality + 2].min
      elsif item.sell_in >= 0
        item.quality = [50, item.quality + 3].min
      else
        item.quality = 0
      end
    end

  end

  class ConjuredItemStrategy
    
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
