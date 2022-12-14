class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def received_one?(item_name)
    self.freebies.exists?(item_name: "#{item_name.capitalize}")
  end

  def give_away(dev, freebie)
    if freebie.dev_id == self.id
      freebie.dev_id = dev.id
      puts "Here you go, #{dev.name}. You can have my #{freebie.item_name}!mo"
    else
      puts "You can't give away what you don't have, dummy!"
    end
  end
end


# Dev#give_away(dev, freebie)
# accepts a Dev instance and a Freebie instance, changes the freebie's dev to be the given dev; your code should only make the change if the freebie belongs to the dev who's giving it away


