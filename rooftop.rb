def roofTopDoor(inventory)
    inventory.look = false

    puts "---- HOSPITAL: ROOFTOP DOOR ----
    "
    puts "You climb the stairs and find a door straight in front of you...
    "

    if inventory.roofKey == true #&& inventory.boltCutter == true
        puts "You use the key and open the door...
        "
        if inventory.boltCutter == true
            puts "The door only opens a few inches, it is held shut by a chain from the outside. As the sound of the zombies gets louder you use the bolt cutter to free yourself...
            "
            gameOver()
        else
            puts "The door only opens a few inches, it is held shut by a chain from the outside. You hear the sound of the zombies getting louder, but you have no where to go but down...
            "
            death()
        end
    else
        puts "The door is locked. It seems to need a key of some sort."
    end

    while choice = gets.chomp()
        case choice
        when "back"
            darkness(inventory)
            break
        when "look"
            puts "You look through the nearby window, and see the door is chained shut from outside as well."
        else
            puts "The command doesn't make sense"
        end
    end
end
