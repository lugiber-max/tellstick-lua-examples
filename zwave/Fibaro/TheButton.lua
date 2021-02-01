-- File: Thebutton.lua
-- Define the names on your devices here:
local remotecontrol = "The Button"
local device1 = "Button 1 click"
local device2 = "Button 2 click"
local device3 = "Button 3 click"
local device4 = "Button 4 click"
local device5 = "Button 5 click"
local release = "Button release"
local hold = "Button hold"

-- DO NOT EDIT BELOW THIS LINE --

COMMAND_CLASS_CENTRAL_SCENE = 0x5B
CENTRAL_SCENE_NOTIFICATION = 0x03

local deviceManager = require "telldus.DeviceManager"

function onZwaveMessageReceived(device, flags, cmdClass, cmd, data)
	if device:name() ~= remotecontrol then
		return
	end
	if cmdClass ~= COMMAND_CLASS_CENTRAL_SCENE or cmd ~= CENTRAL_SCENE_NOTIFICATION then
		return
	end
	if list.len(data) < 3 then
		return
	end
	local sequence = data[0]
	local action = data[1]
	local scene = data[2]
	print("CENTRAL_SCENE_NOTIFICATION from Device: %s, Scene: %s, Action: %s", device:name(), scene, action)

	if action == 0 then -- 1 Click
		local device = deviceManager:findByName(device1)
		device:command("turnon", nil, "Scene")
		print("Turning on device: %s", device1)
	elseif action == 1 then -- Release
		local device = deviceManager:findByName(release)
		device:command("turnoff", nil, "Scene")
		print("Turning off device: %s", release)
	elseif action == 2 then -- Press and hold
		local device = deviceManager:findByName(hold)
		device:command("turnon", nil, "Scene")
		print("Turning on device: %s", hold)
	elseif action == 3 then -- 2 Clicks
		local device = deviceManager:findByName(device2)
		device:command("turnon", nil, "Scene")
		print("Turning on device: %s", device2)
	elseif action == 4 then -- 3 Clicks
		local device = deviceManager:findByName(device3)
		device:command("turnon", nil, "Scene")
		print("Turning on device: %s", device3)
	elseif action == 5 then -- 4 Clicks
		local device = deviceManager:findByName(device4)
		device:command("turnon", nil, "Scene")
		print("Turning on device: %s", device4)
	elseif action == 6 then -- 5 Clicks
		local device = deviceManager:findByName(device5)
		device:command("turnon", nil, "Scene")
		print("Turning on device: %s", device5)
	elseif action == 134 then -- 5 Clicks	- Newer devices seems to have new actions
		local device = deviceManager:findByName(device5)
		device:command("turnon", nil, "Scene")
		print("Turning on device: %s", device5)
	elseif action == 133 then -- 4 Clicks
		local device = deviceManager:findByName(device4)
		device:command("turnon", nil, "Scene")
		print("Turning on device: %s", device4)
	elseif action == 132 then -- 3 Clicks
		local device = deviceManager:findByName(device3)
		device:command("turnon", nil, "Scene")
		print("Turning on device: %s", device3)
	elseif action == 131 then -- 2 Clicks
		local device = deviceManager:findByName(device2)
		device:command("turnon", nil, "Scene")
		print("Turning on device: %s", device2)
	elseif action == 128 then -- 1 Click
		local device = deviceManager:findByName(device1)
		device:command("turnon", nil, "Scene")
		print("Turning on device: %s", device1)
	elseif action == 130 then -- Press and hold
		local device = deviceManager:findByName(hold)
		device:command("turnon", nil, "Scene")
		print("Turning on device: %s", hold)
	elseif action == 129 then -- Release
		local device = deviceManager:findByName(release)
		device:command("turnoff", nil, "Scene")
		print("Turning off device: %s", release)
	end
end
