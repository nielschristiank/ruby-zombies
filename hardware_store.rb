
def hardwareStore(inventory)
    puts "---- HOPE'S HARDWARE ----
    "
    puts "You step into the store and you see that it appears to have been rummaged. You see a handle to an object behind a store shelving...
    "

    while choice = gets.chomp()
        case choice
        when "back"
            hopeTown2(inventory)
            break
        when "look"
            inventory.looked()
            puts "You look behind the shelving and see a bolt cutter on the ground."
        when "take"
            if inventory.look == false
                puts "Take what?"
            else
                if inventory.boltCutter == false
                    inventory.pickUpBoltCutter()
                    puts "You picked up the bolt cutter."
                else
                    puts "You already have that."
                end
            end
        else
            puts "The command doesn't make sense"
        end
    end
end
