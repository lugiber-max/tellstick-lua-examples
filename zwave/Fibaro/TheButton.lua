-- File: TheButtonToggle.lua
-- I didn not understand how the original script worked and I also wanted
-- my button presses to toggle the light. So I modded it so that if a light
-- is turned on it will turn off when you press the button and vice versa.
-- I have very poor knowledge in lua script and python. So please feel free
-- to improve on my script.
-- 
-- Define the names on your devices here:
local remotecontrol = "Fibaro the Button Sovrum"
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
			if (device:state() == 1) then
				device:command("turnoff", nil, "Scene")
				print("Turning off device: %s", device1)
				print("Device state:", device:state()," End.")
			else
				device:command("turnon", nil, "Scene")
				print("Turning on device: %s", device1)
				print("Device state:", device:state()," End.")
			end
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
			if (device:state() == 1) then
				device:command("turnoff", nil, "Scene")
				print("Turning off device: %s", device2)
				print("Device state:", device:state()," End.")
			else
				device:command("turnon", nil, "Scene")
				print("Turning on device: %s", device2)
				print("Device state:", device:state()," End.")
			end
	elseif action == 4 then -- 3 Clicks
		local device = deviceManager:findByName(device3)
			if (device:state() == 'On') then
				device:command("turnoff", nil, "Scene")
				print("Turning off device: %s", device3)
				print("Device state:", device:state())
			else
				device:command("turnon", nil, "Scene")
				print("Turning on device: %s", device3)
				print("Device state:", device:state())
			end
	elseif action == 5 then -- 4 Clicks
                local device = deviceManager:findByName(device4)
			if (device:state() == 'On') then
				device:command("turnoff", nil, "Scene")
				print("Turning off device: %s", device4)
				print("Device state:", device:state())
			else
				device:command("turnon", nil, "Scene")
				print("Turning on device: %s", device4)
				print("Device state:", device:state())
			end
	elseif action == 6 then -- 5 Clicks
                local device = deviceManager:findByName(device5)
			if (device:state() == 'On') then
				device:command("turnoff", nil, "Scene")
				print("Turning off device: %s", device5)
				print("Device state:", device:state())
			else
				device:command("turnon", nil, "Scene")
				print("Turning on device: %s", device5)
				print("Device state:", device:state())
			end
	elseif action == 134 then -- 5 Clicks	- Newer devices seems to have new actions
		local device = deviceManager:findByName(device5)
                        if (device:state() == 'On') then
				device:command("turnoff", nil, "Scene")
				print("Turning off device: %s", device5)
				print("Device state:", device:state())
			else
				device:command("turnon", nil, "Scene")
				print("Turning on device: %s", device5)
				print("Device state:", device:state())
			end
	elseif action == 133 then -- 4 Clicks
		local device = deviceManager:findByName(device4)
                        if (device:state() == 'On') then
				device:command("turnoff", nil, "Scene")
				print("Turning off device: %s", device4)
				print("Device state:", device:state())
			else
				device:command("turnon", nil, "Scene")
				print("Turning on device: %s", device4)
				print("Device state:", device:state())
			end
	elseif action == 132 then -- 3 Clicks
		local device = deviceManager:findByName(device3)
			if (device:state() == 1) then
				device:command("turnoff", nil, "Scene")
				print("Turning off device: %s", device3)
				print("Device state:", device:state()," End.")
			else
				device:command("turnon", nil, "Scene")
				print("Turning on device: %s", device3)
				print("Device state:", device:state()," End.")
			end
	elseif action == 131 then -- 2 Clicks
		local device = deviceManager:findByName(device2)
			if (device:state() == 1) then
				device:command("turnoff", nil, "Scene")
				print("Turning off device: %s", device2)
				print("Device state:", device:state()," End.")
			else
				device:command("turnon", nil, "Scene")
				print("Turning on device: %s", device2)
				print("Device state:", device:state()," End.")
			end
	elseif action == 128 then -- 1 Click
		local device = deviceManager:findByName(device1)
			if (device:state() == 1) then
				device:command("turnoff", nil, "Scene")
				print("Turning off device: %s", device1)
				print("Device state:", device:state()," End.")
			else
				device:command("turnon", nil, "Scene")
				print("Turning on device: %s", device1)
				print("Device state:", device:state()," End.")
			end
	elseif action == 130 then -- Press and hold
		local device = deviceManager:findByName(hold)
		device:command("turnon", nil, "Scene")
		print("Turning on device: %s", hold)
	elseif action == 129 then -- Release
		local device = deviceManager:findByName(release)
		device:command("turnoff", nil, "Scene")
		print("Turning off deviced: %s", release)
	end
end
