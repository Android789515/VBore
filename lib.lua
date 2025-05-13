local function traverse(distance, position)
    if position == distance then
        Log(string.format("Successfully traversed %i blocks.", distance))
        return
    else
        local movedForward, error = turtle.forward()

        if movedForward then
            Log("Traversing...")
            traverse(distance, position + 1)
        else
            Crash(string.format("Turtle got stuck because of: %s", error))
        end
    end
end

local function home(holeSize)
    local isEven = holeSize % 2 == 0

    if isEven then
        turtle.turnRight()
        traverse(holeSize, 0)
        turtle.turnRight()
    else
        turtle.turnRight()
        turtle.turnRight()
        traverse(holeSize, 0)

        turtle.turnRight()
        traverse(holeSize, 0)
        turtle.turnRight()
    end
end

local function digNextSection(rotation)
    if rotation == 1 then
        Log("Starting even section...")
        turtle.turnLeft()
        turtle.dig()
        turtle.forward()
        turtle.turnLeft()
    else
        Log("Starting odd section...")
        turtle.turnRight()
        turtle.dig()
        turtle.forward()
        turtle.turnRight()
    end

    return math.abs(rotation - 1)
end

local function excavateToSize(holeSize)
    local rotation = 0

    turtle.digDown()
    turtle.down()

    for z = 0, (holeSize - 1), 1 do
        for x = 0, (holeSize - 2), 1 do
            Log(string.format("Digging: ( %i, %i )", x, z))
            turtle.dig()
            turtle.forward()
        end

        if z < holeSize - 1 then
            rotation = digNextSection(rotation)
        end
    end
end

local function hasEnoughFuel(fuelRequirement)
    return turtle.getFuelLevel() >= fuelRequirement
end

local function refuel(slot)
    local maxSlot = 15

    turtle.select(slot)
    Log(string.format("Selected slot %i for refueling", slot))

    if turtle.refuel() then
        Log(string.format("Successfully refueled from slot %i.", slot))
        return
    elseif slot <= maxSlot then
        Log("No fuel in this slot.")
        refuel(slot + 1)
    end
end

local function excavateLayer(holeSize)
    if hasEnoughFuel(holeSize ^ 2) then
        Log("Turtle has enough fuel for the next layer.")

        if holeSize == 1 then
            turtle.digDown()
        else
            excavateToSize(holeSize)
        end
    else
        Log("Turtle does not have enough fuel for the next layer.  Attempting to refuel")
        refuel(0)
        excavateLayer(holeSize)
    end
end

local function digLayerDown(targetDepth, currentDepth, holeSize)
    if currentDepth == targetDepth then
        Log(string.format("Target depth of y: %i reached.", targetDepth))
        return
    else
        Log(string.format("Excavating %ix%i layer at y: %i.", holeSize, holeSize, currentDepth))
        excavateLayer(holeSize)

        Log("Homing...")
        home(holeSize)
    end

    digLayerDown(targetDepth, currentDepth - 1)
end

return {
    digLayerDown = digLayerDown,
}
