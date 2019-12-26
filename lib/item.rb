class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
    @update_strategy = nil
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
  
  def update
    @update_strategy.update
  end

  def set_update_strategy(update_strategy)
    @update_stragegy = update_stragegy
  end
  
end