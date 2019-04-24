-- Coded by Hivan --
--- For FiveM ---
---- Forum ----
--- @Hivan  --

-- General --

function SendNotification(msg)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(msg)
  DrawNotification(true, false)
end

-- config --

x = 0
y = 0
z = 0
radius = 10

-- fct --

notified = nil

-- Script --

Citizen.CreateThread(function()
while true do
  Citizen.Wait(0) 
  if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), x,y,z) < radius then -- If distance (player - coords) < of radius then
  	DisableControlAction(0,22,true) -- Space for Jump
  end
end
end)

Citizen.CreateThread(function()
while true do
  Citizen.Wait(0) 
  if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), x,y,z) < radius then -- If distance (player - coords) < of radius then
  	if not notified then
   SendNotification("~r~Jump disabled")
   notified = true
  end
elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), x,y,z) > radius then
	if notified then
	SendNotification("~g~Jump enabled")
	notified = nil
end
end
end
end)