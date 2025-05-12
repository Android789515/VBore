local function startLayer()
   turtle.digDown()
   turtle.down()
end

local function homeTurtle(holeSize, partial)
   turtle.turnRight()
   turtle.turnRight()

   for x = 1, (holeSize - 2), 1 do
      turtle.forward()
   end

   if not (partial) then
      turtle.turnRight()

      for _ = 1, (holeSize - 1), 1 do
         turtle.forward()
      end

      turtle.turnRight()
   end
end

local function startNextZ()
   turtle.turnLeft()
   turtle.dig()
   turtle.forward()
   turtle.turnLeft()
end

local function digOdd(holeSize, log)
   for z = 1, holeSize, 1 do
      for x = 1, holeSize, 1 do
         turtle.dig()

         if x < (holeSize - 1) then
            turtle.forward()
         end
      end

      if z < holeSize then
         homeTurtle(holeSize, true)
         log("Partially homing...")
         
         startNextZ()
         log("Starting next Z...")
      end
   end

   homeTurtle(holeSize, false)
   log("Homing...")
end

return {
   startLayer = startLayer,
   homeTurtle = homeTurtle,
   startNextZ = startNextZ,
   digOdd = digOdd,
}
