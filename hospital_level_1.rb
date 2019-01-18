require './items'
require './player'
require './monsters'

class Room
  attr_accessor :name, :items, :enemies

  def initialize(name = "room", items = [], enemies = [])
    @name = name
    @items = items
    @enemies = enemies
  end
end

#hospital_room = Room.new("HOSPITAL ROOM", [Axe.new("Fire Axe")], [])

#------HOSPITAL-------#
def hospitalRoom(player)#, hospital_room)
  puts "---- HOSPITAL ROOM ----:"
  puts "You look around and notice that the room is in disarray. It's very quiet. You see a barred WINDOW on your RIGHT and STRAIGHT ahead is a DOOR that leads to the hallway...

  [commands: look, take, use, inventory, etc]
  "

  item = Axe.new("Axe")

  while choice = gets.chomp().downcase
    case choice
    when ("door" || "straight")
      #hospital_hallway = Room.new("HOSPITAL HALLWAY", items = [], enemies = [])
      hospitalHallway(player)#, hospital_hallway)
      break
    when ("window" || "right")
      puts "You look out the window. The town looks very quiet..."
    when "look"
      puts "You see that the EKG machines are not on. It appears that the power is out..."
        if(!player.inventory.include?(item))
          puts "...laying next to the machine is an AXE..."
        else
          puts "...the Axe has been picked up"
        end
    when "take"
      puts "take what? (take + [item])"
    when ("take " + item.class.name.downcase)
      if(!player.inventory.include?(item))
        player.addItem(item)
        puts "You picked up the " + item.item_name
      else
        puts "You already have the Axe."
      end
    when "inventory"
      player.viewInventory
    else
        puts "The command doesn't make sense"
    end
  end

end

def hospitalHallway(player)
  zombies = [Zombie.new, Zombie.new, Zombie.new, Zombie.new]

  puts "---- HOSPITAL HALLWAY ----:
  "
  puts "You stepped into the hallway. The lights flicker. To your RIGHT you see sunlight creeping through a crack in the hospital ENTRANCE. To your LEFT is DARKNESS...
  "
  puts "ZOMBIE ATTACK!
  four zombies appear from the darkness...
  "
  puts "[commands: look, take/use/inspect + 'item', inventory, back (back to previous area)]"

  while zombies.length > 0
    action = gets.chomp().downcase
    if action.start_with?("use")
      words = action.split
      if !player.inventory.words[1].nil?
        item = words[1]
        p item.item_name
        if item.item_name.downcase == words[1]
          if item.broken == false
            zombies[0].hp = zombies[0].hp - item.use
            puts "dealt 1 damage to a zombie"
          else
            puts "item needs repair"
          end
          if zombies[0].hp <= 0
            zombies.shift
            puts "1 zombie is defeated #{zombies.length} zombies remaining"
          end
        else
          puts "not a usable item"
        end
      end
    elsif "run"
      hospitalRoom(player)
    else
      puts "zombies are attacking, you must fight or run (use item, or run)"
    end
  end

  puts "zombies are defeated!"

  while choice = gets.chomp().downcase
    case choice
    when "look"
      puts "The a wall in front of you is covered in bloody hand prints..."
    when ("right" || "entrance")
      hopeTown(player)
      break
    when "back"
      hospitalRoom(player)
      break
    when "left"
      darkness(player)
      break
    else
      puts "The command doesn't make sense"
    end
  end

end

def darkness(inventory)

    if inventory.flashlight == false
        puts "---- HOSPITAL: DARK HALLWAY ----
        "
        puts "The hallway is too dark to see. You hear something breathing close by...
        "
        death()
    else
        puts "---- HOSPITAL: DARK HALLWAY ----
        "
        puts "The hallway is too dark to see. You use the flashlight to see a stair case straight ahead, and a door to your right.
        "
    end

    while choice = gets.chomp()
        case choice
        when "back"
            hospitalHallway(inventory)
            break
        when "straight"
            roofTopDoor(inventory)
            break
        when "right"
            hospitalCloset(inventory)
            break
        else
            puts "The command doesn't make sense"
        end
    end
end

def hospitalCloset(inventory)
    inventory.look = false

    puts "---- HOSPITAL: CLOSET ----
    "
    puts "A zombie jumps out of the closet...
    "

    if inventory.gun == false
        puts "You have no weapon to defend yourself. The zombie eats you alive!"
        death()
    elsif inventory.gun == true && inventory.bullet == false
        puts "You fire your gun, but have no bullets. The zombie eats you alive!"
        death()
    else
        puts "You fire your gun, and shot the zombie clean through the head. The zombie falls to the ground, and you hear a 'clink' sound...
        "
        puts "[Use following commands for action: take, look, unlock, use]
        "
    end

    while choice = gets.chomp()
        case choice
        when "back"
            darkness(inventory)
            break
        when "look"
            inventory.looked()
            puts "You see a ring of keys on the ground and notice a nametag 'Rick' on the fallen zombie."
        when "take"
            if inventory.look == false
                puts "Take what?"
            else
                if inventory.roofKey == false
                    inventory.pickUpRoofKey()
                    puts "You picked up a ring of keys."
                else
                    puts "You already have that."
                end
            end
        else
            puts "The command doesn't make sense"
        end
    end
end
