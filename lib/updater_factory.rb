class UpdaterFactory

  def self.get_updater(item) 

    case item.name
    when "Sulfuras, Hand of Ragnaros"
      SulfurasUpdater.new(item)
    else
      DefaultUpdater.new(item)
    end

  end

end