class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
        
      if item.name == "Sulfuras, Hand of Ragnaros"
        updater = SulfurasUpdater.new(item)
        updater.update_item_quality
        updater.update_item_sell_in
        next
      end

      if item.name == "Aged Brie"
        if item.sell_in > 0
          item.quality = [50, item.quality + 1].min
        else
          item.quality = [50, item.quality + 2].min
        end
        item.sell_in = item.sell_in - 1
        next
      end

      if item.name == "Backstage passes to a TAFKAL80ETC concert"
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
        next
      end

      if item.name == "Conjured Item"
        if item.sell_in > 0
          item.quality = [0, item.quality - 2].max
        else
          item.quality = [0, item.quality - 4].max
        end
        item.sell_in = item.sell_in - 1
        next
      end

      updater = DefaultUpdater.new(item)
      updater.update_item_quality
      updater.update_item_sell_in

    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

class UpdaterFactory

  def self.get_updater(item) 

    case item.name
    when "Sulfuras, Hand of Ragnaros"
      SulfurasUpdater.new(item)
    else
      DefaultUpdater(item)
    end

  end

end


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

class SulfurasUpdater < DefaultUpdater

  def initialize(item)
    @item = item
  end

  def update_item_quality
  end

  def update_item_sell_in
  end

end