require './hopetown'
require './hospital_level_1'
require './police_station'
require './hardware_store'
require './house'
require './rooftop'
require './items'
require './player'
require './monsters'
# BEGIN STORY -------------------------------------------------------

def startGame
    puts
    puts "------ NO HOPE ------:
    "
    puts "You wake up in a hospital. You're on a patient bed and you don't remember why or what happened.

    What is your name? "
    name = gets.chomp()
    player = Player.new(name)
    #hospital_room = Room.new("HOSPITAL ROOM", [Axe.new("Fire Axe")], [])
    hospitalRoom(player)#, hospital_room)
end

def death()
    puts "YOU'RE DEAD! TRY AGAIN? (y/n)"
    while choice = gets.chomp()
        case choice
        when "y"
            startGame()
            break
        when "n"
            break
        else
            puts "The command doesn't make sense"
        end
    end
end

def gameOver()
    puts "As you run out onto the rooftop you see a helicopter taking off. One of the rescue team members yells something but you can't make it out. He throws down a ladder and you climb up as the helicopter begins to leave.

    CONGRATULATIONS YOU ESCAPED HOPETOWN!"
end

#items = Items.new
#p items.ram

startGame()
