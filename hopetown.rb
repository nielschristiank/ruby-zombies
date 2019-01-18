
def hopeTown(inventory)
    puts "---- HOPETOWN ----
    "
    puts "As eyes adjust to the sunlight you start to see buildings take shape. STRAIGHT ahead you see what appears to be a police station. To the LEFT you see a makeshift barricade of cars and trash. To your RIGHT you see a sign reading 'Hope's Hardware: 200ft ---> '.
    "

    while choice = gets.chomp()
        case choice
        when "straight"
            policeStation(inventory)
            break
        when "right"
            hopeTown2(inventory)
            break
        when "back"
            hospitalHallway(inventory)
            break
        when "left"
            puts "The barricade is covered in rotting corpses. It appears to be impassable..."
        else
            puts "The command doesn't make sense"
        end
    end
end


def hopeTown2(inventory)
    puts "---- HOPETOWN: OUTSIDE OF HARDWARE STORE ----
    "
    puts "To your left you see a local hardware store with a storefront sign of 'HOPE'S HARDWARE' hanging by one nail. Straight ahead you can barely see a building that appears to be a house...
    "

    while choice = gets.chomp()
        case choice
        when "straight"
            hopeTown3(inventory)
            break
        when "back"
            hopeTown(inventory)
            break
        when "left"
            hardwareStore(inventory)
            break
        else
            puts "The command doesn't make sense"
        end
    end
end



def hopeTown3(inventory)
    puts "---- HOPETOWN: OUTSIDE OF HOUSE ----
    "
    puts "To your left you see a single story house with the front door slightly ajar..
    "

    while choice = gets.chomp()
        case choice
        when "back"
            hopeTown2(inventory)
            break
        when "left"
            house(inventory)
            break
        else
            puts "The command doesn't make sense"
        end
    end
end
