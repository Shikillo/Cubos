-- Cosa Picar

-- Function to check and refuel the turtle
function refuel()
    if turtle.getFuelLevel() < 10 then
        turtle.select(1) -- Assumes fuel is in slot 1
        turtle.refuel(1)
    end
end

-- Function to dig forward and move
function digForward()
    while not turtle.forward() do
        turtle.dig()
        sleep(0.5) -- wait half a second to prevent getting stuck
    end
end

-- Function to dig up and move up
function digUp()
    while not turtle.up() do
        turtle.digUp()
        sleep(0.5) -- wait half a second to prevent getting stuck
    end
end

-- Function to dig down and move down
function digDown()
    while not turtle.down() do
        turtle.digDown()
        sleep(0.5) -- wait half a second to prevent getting stuck
    end
end

-- Main program
function dig9x9AndReturn()
    local totalDistance = 0
    for forwardMove = 1, 100 do
        for i = 1, 9 do
            digForward()
            refuel() -- Check and refuel if needed
            if i < 9 then -- Avoid turning on the last column
                if forwardMove % 2 == 1 then
                    turtle.turnRight()
                    digForward()
                    turtle.turnRight()
                else
                    turtle.turnLeft()
                    digForward()
                    turtle.turnLeft()
                end
            end
        end
        if forwardMove % 2 == 0 then -- On even moves, reverse direction to zigzag
            turtle.turnRight()
            turtle.turnRight()
        else
            -- Add logic to dig up or down based on the layer
            -- Assuming starting at the top layer and moving down
            digDown()
        end
        totalDistance = totalDistance + 1
        if totalDistance == 100 then
            break
        end
    end
    
    -- Return to start (simplified, adjust based on actual requirements)
    turtle.turnRight()
    turtle.turnRight()
    for i = 1, totalDistance do
        digForward()
    end
end

dig9x9AndReturn()
