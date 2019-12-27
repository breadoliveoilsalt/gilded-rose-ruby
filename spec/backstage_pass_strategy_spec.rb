require_relative '../lib/item.rb'
require_relative '../lib/item_update_strategies.rb'

describe ItemUpdateStrategies::BackstagePassStrategy do

  describe "#update" do

    it "increases the quality of 1 if the sell_in date is greater than 10" do
      backstagePass_1 = Item.new("Backstage passes to a TAFKAL80ETC concert", 20, 0)
      updater_1 = ItemUpdateStrategies::BackstagePassStrategy.new
      backstagePass_2 = Item.new("Backstage passes to a TAFKAL80ETC concert", 30, 0)
      updater_2 = ItemUpdateStrategies::BackstagePassStrategy.new

      updater_1.update(backstagePass_1) 
      updater_2.update(backstagePass_2) 

      expect(backstagePass_1.quality).to eq 1
      expect(backstagePass_2.quality).to eq 1
    end

    it "increases the quality by 2 if the sell_in date is from 6 to 10" do
      backstagePass_1 = Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 0)
      updater_1 = ItemUpdateStrategies::BackstagePassStrategy.new
      backstagePass_2 = Item.new("Backstage passes to a TAFKAL80ETC concert", 6, 0)
      updater_2 = ItemUpdateStrategies::BackstagePassStrategy.new

      updater_1.update(backstagePass_1) 
      updater_2.update(backstagePass_2) 
      
      expect(backstagePass_1.quality).to eq 2
      expect(backstagePass_2.quality).to eq 2
    end

    it "increases the quality by 3 if the sell_in date is from 1 to 5" do
      backstagePass_1 = Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 0)
      updater_1 = ItemUpdateStrategies::BackstagePassStrategy.new
      backstagePass_2 = Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 0)
      updater_2 = ItemUpdateStrategies::BackstagePassStrategy.new

      updater_1.update(backstagePass_1) 
      updater_2.update(backstagePass_2) 
      
      expect(backstagePass_1.quality).to eq 3
      expect(backstagePass_2.quality).to eq 3
    end

    it "does not increase the quality of a backstage pass beyond 50" do
      backstagePass_1 = Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 50)
      updater_1 = ItemUpdateStrategies::BackstagePassStrategy.new
      backstagePass_2 = Item.new("Backstage passes to a TAFKAL80ETC concert", 3, 49)
      updater_2 = ItemUpdateStrategies::BackstagePassStrategy.new

      updater_1.update(backstagePass_1) 
      updater_2.update(backstagePass_2) 
      
      expect(backstagePass_1.quality).to eq 50
      expect(backstagePass_2.quality).to eq 50
    end

    it "lowers the quality to 0 if the sell_in date is 0 or less" do
      backstagePass_1 = Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 45)
      updater_1 = ItemUpdateStrategies::BackstagePassStrategy.new
      backstagePass_2 = Item.new("Backstage passes to a TAFKAL80ETC concert", -1, 45)
      updater_2 = ItemUpdateStrategies::BackstagePassStrategy.new

      updater_1.update(backstagePass_1) 
      updater_2.update(backstagePass_2) 
      
      expect(backstagePass_1.quality).to eq 0
      expect(backstagePass_2.quality).to eq 0
    end

    it "does not decrease the quality below 0" do
      backstagePass_1 = Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 0)
      updater_1 = ItemUpdateStrategies::BackstagePassStrategy.new
      backstagePass_2 = Item.new("Backstage passes to a TAFKAL80ETC concert", -1, 0)
      updater_2 = ItemUpdateStrategies::BackstagePassStrategy.new

      updater_1.update(backstagePass_1) 
      updater_2.update(backstagePass_2) 
      
      expect(backstagePass_1.quality).to eq 0
      expect(backstagePass_2.quality).to eq 0
    end

    it "lowers the sell_in date by 1" do
      backstagePass = Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 45)
      updater = ItemUpdateStrategies::BackstagePassStrategy.new

      updater.update(backstagePass)
      
      expect(backstagePass.sell_in).to eq 9
    end

  end

end