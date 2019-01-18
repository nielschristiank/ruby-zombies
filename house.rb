# -------- HOUSE-----

def house(inventory)
    puts "---- HOUSE: LIVING ROOM ----
    "
    puts "You step into the living room. For some reason this place seems familiar but you don't know why. Straight ahead in the kitchen you hear static. To your left you see a coat closet.
    "

    while choice = gets.chomp()
        case choice
        when "straight"
            kitchen(inventory)
            break
        when "left"
            closet(inventory)
            break
        when "back"
            hopeTown3(inventory)
            break
        else
            puts "The command doesn't make sense"
        end
    end
end

def kitchen(inventory)
    inventory.look = false
    puts "---- HOUSE: KITCHEN ----
    "
    puts "As soon as you step into the kitchen you notice a horrible stench. There is a radio on the counter with crackling sounds coming from it. On the table you notice a crumbled paper and with an item inside of it.

    [Use following commands for action: take, look, unlock, use]
    "

    while choice = gets.chomp()
        case choice
        when "back"
            house(inventory)
            break
        when "use"
            puts "You adjust the knob on the radio slightly and come across an emergency broadcast station.

            'EVACUATE IMMEDIATELY. THE NEXT RESCUE TEAM WILL BE LANDING ON THE HOSPITAL ROOF.' "
        when "look"
            puts "You unfold the cruppled paper. The paper has a message written on it: 'AHHHH!!!!'
            "
            puts "You try to figure out what this peculiar symbol means. It seems like someone tried to draw a magical horse or something...
            "
            puts "As you try to decipher the odd message, you notice that a bullet fell out of the paper...
            "
            inventory.looked()
        when "take"
            if inventory.look == false
                puts "Take what?"
            else
                if inventory.bullet == false
                    inventory.pickUpBullet()
                    puts "You picked up the bullet."
                else
                    puts "You already have that."
                end
            end
        else
            puts "The command doesn't make sense"
        end
    end
end

def closet(inventory)
    inventory.look = false
    puts "---- HOUSE: CLOSET ----
    "
    puts "There's a bunch of coats in the closet. There appears to be an object sticking out of a coat pocket...
    "

    while choice = gets.chomp()
        case choice
        when "back"
            house(inventory)
            break
        when "look"
            inventory.looked()
            puts "The coat pocket appears to have a flashlight inside of it."
        when "take"
            if inventory.look == false
                puts "Take what?"
            else
                if inventory.flashlight == false
                    inventory.pickUpFlashlight()
                    puts "You picked up the flashlight."
                else
                    puts "You already have that."
                end
            end
        else
            puts "The command doesn't make sense"
        end
    end
end
