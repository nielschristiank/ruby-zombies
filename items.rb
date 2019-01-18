
#---------ITEMS-------------#
class Item
  attr_accessor :item_name, :item_type
    def initialize(item_name = "name", item_type = "item")
      @item_name =item_name
      @item_type = item_type
      @found = false
      @broken = false
    end

    def inspect
      puts "#{@item_name}: type: #{@item_type}"
    end

end

#------WEAPONS------#

class Weapon < Item
  attr_accessor :damage, :hp

  def initialize(item_name = "name", item_type = "weapon",damage = 0, hp = 0)
    super(item_name, item_type)
    @item_type = item_type
    @damage = damage
    @hp = hp
  end

  def inspect
    super
    puts " #{@damage}"
  end

end

#------MELEE------#

class Melee < Weapon
  attr_reader :melee
  def initialize(item_name = "name", item_type = "melee-weapon", damage = 1, hp = 3)
    super(item_name, item_type, damage, hp)
    @melee = true
  end

  def inspect
    super
    puts " - uses left: #{@hp}"
  end

  def use
    if @broken == false
      if @hp > 0
        @broken = true
        puts "item is broken, need repair"
      else
        @hp = @hp - 1
        return @damage
      end
    else
      puts item.item_name + " is broken."
    end
  end

end

class Sword < Melee
  def initialize(item_name = "name", item_type = "melee-weapon", damage = 1, hp = 3)
    super(item_name, item_type, damage, hp)
  end
end

class Axe < Melee
  def initialize(item_name = "name", item_type = "melee-weapon", damage = 1, hp = 3)
    super(item_name, item_type, damage, hp)
  end
end

#------RANGED------#

class Ranged < Weapon
  attr_reader :ranged, :ammo, :clipSize
  def initialize(item_name = "name", item_type = "ranged-weapon", damage = 1, ammo = 0, clipSize = 0)
    super(item_name, item_type, damage)
    @ranged = true
    @ammo = ammo
    @clipSize = clipSize
  end

  def inspect
    super
   puts " - ammo left: #{@ammo}"
  end

  def use
    if @ammo == 0
      puts "Out of ammo..."
    else
      @ammo = @ammo - 1
      return @damage
    end
  end

end

class Pistol < Ranged
  def initialize(item_name = "name", item_type = "ranged-weapon", damage = 2, ammo = 0, clipSize = 7)
    super(item_name, item_type, damage, ammo, clipSize)
  end
end

class Shotgun < Ranged
  def initialize(item_name = "name", item_type = "ranged-weapon", damage = 4, ammo = 0, clipSize = 2)
    super(item_name, item_type, damage, ammo, clipSize)
  end
end

#----Other Items-----#
class Key < Item
end


# attr_accessor :roofKey, :boltCutter, :ram, :crowBar, :flashlight, :gun, :bullet, :paper, #:look
#
# def initialize()
#     @roofKey = found: false
#     @boltCutter = false
#     @ram = false
#     @crowBar = false
#     @flashlight = false
#     @gun = false
#     @bullet = false
#     @paper = false
#     @inventory = [@roofKey, @boltCutter, @ram, @crowBar, @flashlight, @gun, @bullet, @paper]
# end
