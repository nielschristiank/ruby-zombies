
def policeStation(inventory)
    puts "---- HPD: HOPE POLICE DEPARTMENT ----
    "
    puts "The lobby is covered in broken glass, and the furniture is overturned. It appears this place was abandoned a while ago. To your LEFT you see a door ajar, the sign has fallen off. STRAIGHT ahead you see a closed door labeled 'Evidence Room'...
    "

    while choice = gets.chomp()
        case choice
        when "straight"
            if(inventory.ram == true)
                puts "You break down the door..."
                evidenceRoom(inventory)
                break
            else
                puts "The door seems to be jammed...
                ::If only I had something to break the door down::"
            end
        when "right"
            puts "You see the front desk. The computer is broken, and a body in a police uniform is slumped over the desk. Behind the desk a message on the wall reads 'RUN'..."
        when "back"
            hopeTown(inventory)
            break
        when "left"
            breakRoom(inventory)
            break
        else
            puts "The command doesn't make sense"
        end
    end
end

def breakRoom(inventory)
    inventory.look = false
    puts "---- HPD: BREAK ROOM ----
    "
    puts "You see an object leaning against the wall...

    [Use following commands for action: take, look, unlock, use]
    "

    while choice = gets.chomp()
        case choice
        when "back"
            policeStation(inventory)
            break
        when "look"
            puts "A beaten up battering ram leans against the wall."
            inventory.looked()
        when "take"
            if inventory.look == false
                puts "Take what?"
            else
                if inventory.ram == false
                    inventory.pickUpRam()
                    puts "You picked up the battering ram."
                else
                    puts "You already have that."
                end
            end
        else
            puts "The command doesn't make sense"
        end
    end
end

def evidenceRoom(inventory)
    inventory.look = false
    puts "---- HPD: EVIDENCE ROOM ----
    "
    puts "STRAIGHT ahead you see a desk with a drawer that is slightly open...
    "

    while choice = gets.chomp()
        case choice
        when "back"
            policeStation(inventory)
            break
        when "look"
            inventory.looked()
            puts "The drawer appears to have a handgun inside."
        when "take"
            if inventory.look == false
                puts "Take what?"
            else
                if inventory.gun == false
                    inventory.pickUpGun()
                    puts "You picked up the handgun."
                else
                    puts "You already have that."
                end
            end
        else
            puts "The command doesn't make sense"
        end
    end
end
