require_relative '../lib/item.rb'
require_relative '../lib/item_update_strategies.rb'

describe ItemUpdateStrategies::AgedBrieStrategy do

  describe "#update" do
  
    it "increases the quality of Aged Brie by 1 if the sell_in date is greater than 0" do
      brie_1= Item.new("Aged Brie", 10, 5)
      brie_2 = Item.new("Aged Brie", 1, -10)
      strategy = ItemUpdateStrategies::AgedBrieStrategy.new
      
      strategy.update(brie_1)
      strategy.update(brie_2)

      expect(brie_1.quality).to eq 6
      expect(brie_2.quality).to eq -9
    end
      
    it "increases the quality of Aged Brie by 2 if the sell_in date is 0 or less" do
      brie_1 = Item.new("Aged Brie", 0, 5)
      brie_2 = Item.new("Aged Brie", -10, 5)
      strategy = ItemUpdateStrategies::AgedBrieStrategy.new
      
      strategy.update(brie_1)
      strategy.update(brie_2)

      expect(brie_1.quality).to eq 7
      expect(brie_2.quality).to eq 7
    end
      
    it "does not increase the quality of Aged Brie beyond 50" do
      brie_1 = Item.new("Aged Brie", 10, 50)
      brie_2 = Item.new("Aged Brie", -10, 49) 
      strategy = ItemUpdateStrategies::AgedBrieStrategy.new
      
      strategy.update(brie_1)
      strategy.update(brie_2)

      expect(brie_1.quality).to eq 50
      expect(brie_2.quality).to eq 50
    end

    it "lowers the Aged Brie's sell_in date by 1" do
      brie = Item.new("Aged Brie", 10, 5)
      strategy = ItemUpdateStrategies::AgedBrieStrategy.new

      strategy.update(brie)

      expect(brie.sell_in).to eq 9
    end

  end

end