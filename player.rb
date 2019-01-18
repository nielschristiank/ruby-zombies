require './items'

#-------PLAYER---------#
class Player
  attr_accessor :name, :hp, :inventory
  def initialize(name = "Jone Doe")
    @name = name
    @hp = 10
    @inventory = {}
  end

  def addItem(item)
    @inventory[item.item_name] = item
  end

  def useItem(item)
  end

  def removeItem(item)
    @inventory.delete(item.item_name)
  end

  def viewInventory
    puts "Items: " + @inventory.length.to_s
    @inventory.each {|item| puts item.class.name + ": " + item.item_name}
  end

end

# player = Player.new
# sword = Sword.new
# pistol = Pistol.new
#
# p player
# p sword
# p pistol
#
# player.addItem(sword)
# player.addItem(pistol)
# p player.inventory
# player.removeItem(sword)
# p player

# item = Item.new
# weapon = Weapon.new
# melee = Melee.new
# sword = Sword.new
# axe = Axe.new
# ranged = Ranged.new
# pistol = Pistol.new
# shotgun = Shotgun.new
# p item
# p weapon
# p melee
# p sword
# p axe
# p ranged
# p pistol
# p shotgun
