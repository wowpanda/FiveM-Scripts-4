-- Coded by Hivan --
--- For FiveM ---
---- Forum ----
--- @Hivan - @Hivanzh --

-- config --

-- x, y, z, radius --

disabled = {
  {-29.596,-1103.832,26.422, 10}, -- Motorshop
  {12.653217315674,-1105.1201171875,29.797031402588, 5} -- Armory
}

-- Script --

Citizen.CreateThread(function()
while true do
  Citizen.Wait(0)
  for i = 1, #disabled do
    disabled2 = disabled[i] 
  if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), disabled2[1],disabled2[2],disabled2[3]) < disabled2[4] then -- If distance (player - coords) < of radius then
  	DisableControlAction(0,22,true) -- Space for Jump
  x = disabled2[1]
  y = disabled2[2]
  z = disabled2[3]
  r = disabled2[4]
  end
  end
end
end)

Citizen.CreateThread(function()
while true do
  Citizen.Wait(100) 
  if x then
  for i = 1, #disabled do
    disabled2 = disabled[i] 
  if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), x,y,z) < r then -- If distance (player - coords) < of radius then
  	if not notified then
   SendNotification("~r~Jump disabled")
   notified = true
  end
elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), x,y,z) > r then
	if notified then
	SendNotification("~g~Jump enabled")
	notified = nil
  x = 0
  y = 0
  z = 0
  r = 0
end
end
end
end
end
end)

-- do not touch --

-- Coords --

x = nil
y = nil
z = nil
r = nil 

-- fct --

notified = nil

-- General --

function SendNotification(msg)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(msg)
  DrawNotification(true, false)
end
