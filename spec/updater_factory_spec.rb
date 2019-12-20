require_relative '../lib/item.rb'
require_relative '../lib/updater_factory.rb'
require_relative '../lib/sulfuras_updater.rb'
require_relative '../lib/default_updater.rb'

describe UpdaterFactory do

  describe "#get_updater" do 

    it "instantiates a SulfurasUpdater when passed a Sulfuras item" do
      sulfuras = Item.new("Sulfuras, Hand of Ragnaros", 10, 80)

      result = UpdaterFactory.get_updater(sulfuras)

      expect(result).to be_a(SulfurasUpdater)
    end

    it "instantiates a DefaultUpdater when passed a non-specialized item" do
      item = Item.new("Ordinary Item", 10, 5)
        
      result = UpdaterFactory.get_updater(item)

      expect(result).to be_a(DefaultUpdater)
    end

  end

end