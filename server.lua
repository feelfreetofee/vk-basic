RegisterCommand("setcoords", function(source, args)
	if args[4] then
		local playerId = args[1]
		local x,y,z = 0.0+args[2],0.0+args[3],0.0+args[4]
		TriggerClientEvent('setcoords', playerId, x, y, z)
	else
		local x,y,z = 0.0+args[1],0.0+args[2],0.0+args[3]
		TriggerClientEvent('setcoords', source, x, y, z)
	end
end)

RegisterCommand("tp", function(source, args)
	if args[2] then
			if args[1] ~= args[2] then
			local playerId = args[1]
			local targetplayerId = tonumber(args[2])
			TriggerClientEvent('tp', playerId, targetplayerId)
		end
	else
		if tonumber(args[1]) ~= source then
			local targetplayerId = tonumber(args[1])
			TriggerClientEvent('tp', source, targetplayerId)
		end
	end
end)

RegisterCommand("setped", function(source, args)
	if args[2] then
		local playerId = args[1]
		local model = args[2]
		TriggerClientEvent('setped', playerId, model)
	else
		local model = args[1]
		TriggerClientEvent('setped', source, model)
	end
end)

RegisterCommand("togglegodmode", function(source, args)
	if args[1] then
		local playerId = args[1]
		TriggerClientEvent('togglegodmode', playerId)
	else
		TriggerClientEvent('togglegodmode', source)
	end
end)

RegisterCommand("sethealth", function(source, args)
	if args[2] then
		local playerId = args[1]
		local health = tonumber(args[2])
		TriggerClientEvent('sethealth', playerId, health)
	else
		local health = tonumber(args[1])
		TriggerClientEvent('sethealth', source, health)
	end
end)

RegisterCommand("setarmour", function(source, args)
	if args[2] then
		local playerId = args[1]
		local armour = tonumber(args[2])
		TriggerClientEvent('setarmour', playerId, armour)
	else
		local armour = tonumber(args[1])
		TriggerClientEvent('setarmour', source, armour)
	end
end)

RegisterCommand("setwantedlevel", function(source, args)
	if args[2] then
		local playerId = args[1]
		local level = args[2]
		TriggerClientEvent('setwantedlevel', playerId, model)
	else
		local level = args[1]
		TriggerClientEvent('setwantedlevel', source, model)
	end
end)

RegisterCommand("giveweapon", function(source, args)
	if args[2] then
		local playerId = args[1]
		if args[2] == 'parachute' then
			local weapon = 'gadget_'..args[2]
			local weaponHash = GetHashKey(weapon)
			TriggerClientEvent('giveweapon', playerId, weaponHash)
		else
			local weapon = 'weapon_'..args[2]
			local weaponHash = GetHashKey(weapon)
			TriggerClientEvent('giveweapon', playerId, weaponHash)
		end
	else
		if args[1] == 'parachute' then
			local weapon = 'gadget_'..args[1]
			local weaponHash = GetHashKey(weapon)
			TriggerClientEvent('giveweapon', source, weaponHash)
		else
			local weapon = 'weapon_'..args[1]
			local weaponHash = GetHashKey(weapon)
			TriggerClientEvent('giveweapon', source, weaponHash)
		end
	end
end)

RegisterCommand("removeweapon", function(source, args)
	if args[2] then
		local playerId = args[1]
		if args[2] == 'all' then
			TriggerClientEvent('removeweapons', playerId)
		elseif args[2] == 'parachute' then
			local weapon = 'gadget_'..args[2]
			local weaponHash = GetHashKey(weapon)
			TriggerClientEvent('removeweapon', playerId, weaponHash)
		else
			local weapon = 'weapon_'..args[2]
			local weaponHash = GetHashKey(weapon)
			TriggerClientEvent('removeweapon', playerId, weaponHash)
		end
	else
		if args[1] == 'all' then
			TriggerClientEvent('removeweapons', source)
		elseif args[1] == 'parachute' then
			local weapon = 'gadget_'..args[1]
			local weaponHash = GetHashKey(weapon)
			TriggerClientEvent('removeweapon', source, weaponHash)
		else
			local weapon = 'weapon_'..args[1]
			local weaponHash = GetHashKey(weapon)
			TriggerClientEvent('removeweapon', source, weaponHash)
		end
	end
end)

RegisterCommand("givecomponentweapon", function(source, args)
	if args[3] then
		local playerId = args[1]
		local weapon = 'weapon_'..args[2]
		local weaponHash = GetHashKey(weapon)
		local component = args[3]
		local componentHash = GetHashKey(component)
		TriggerClientEvent('givecomponentweapon', playerId, weaponHash, componentHash)
	else
		local weapon = 'weapon_'..args[1]
		local weaponHash = GetHashKey(weapon)
		local component = args[2]
		local componentHash = GetHashKey(component)
		TriggerClientEvent('givecomponentweapon', source, weaponHash, componentHash)
	end
end)

RegisterCommand("removecomponentweapon", function(source, args)
	if args[3] then
		local playerId = args[1]
		local weapon = 'weapon_'..args[2]
		local weaponHash = GetHashKey(weapon)
		local component = args[3]
		local componentHash = GetHashKey(component)
		TriggerClientEvent('removecomponentweapon', playerId, weaponHash, componentHash)
	else
		local weapon = 'weapon_'..args[1]
		local weaponHash = GetHashKey(weapon)
		local component = args[2]
		local componentHash = GetHashKey(component)
		TriggerClientEvent('removecomponentweapon', source, weaponHash, componentHash)
	end
end)

RegisterCommand("setweapontint", function(source, args)
	if args[3] then
		local playerId = args[1]
		local weapon = 'weapon_'..args[2]
		local weaponHash = GetHashKey(weapon)
		local tint = tonumber(args[3])
		TriggerClientEvent('setweapontint', playerId, weaponHash, tint)
	else
		local weapon = 'weapon_'..args[1]
		local weaponHash = GetHashKey(weapon)
		local tint = tonumber(args[2])
		TriggerClientEvent('setweapontint', source, weaponHash, tint)
	end
end)

RegisterCommand("setammoweapon", function(source, args)
	if args[3] then
		local playerId = args[1]
		local weapon = 'weapon_'..args[2]
		local weaponHash = GetHashKey(weapon)
		local ammo = tonumber(args[3])
		TriggerClientEvent('setammoweapon', playerId, weaponHash, ammo)
	else
		local weapon = 'weapon_'..args[1]
		local weaponHash = GetHashKey(weapon)
		local ammo = tonumber(args[2])
		TriggerClientEvent('setammoweapon', source, weaponHash, ammo)
	end
end)

RegisterCommand("addammoweapon", function(source, args)
	if args[3] then
		local playerId = args[1]
		local weapon = 'weapon_'..args[2]
		local weaponHash = GetHashKey(weapon)
		local ammo = tonumber(args[3])
		TriggerClientEvent('addammoweapon', playerId, weaponHash, ammo)
	else
		local weapon = 'weapon_'..args[1]
		local weaponHash = GetHashKey(weapon)
		local ammo = tonumber(args[2])
		TriggerClientEvent('addammoweapon', source, weaponHash, ammo)
	end
end)


RegisterCommand("enableinfiniteclipammo", function(source, args)
	if args[1] then
		local playerId = args[1]
		TriggerClientEvent('enableinfiniteclipammo', playerId)
	else
		TriggerClientEvent('enableinfiniteclipammo', source)
	end
end)

RegisterCommand("disableinfiniteclipammo", function(source, args)
	if args[1] then
		local playerId = args[1]
		TriggerClientEvent('disableinfiniteclipammo', playerId)
	else
		TriggerClientEvent('disableinfiniteclipammo', source)
	end
end)

RegisterCommand("giveweaponcategory", function(source, args)
	if args[2] then
		local playerId = args[1]
		local category = args[2]
		if category == 'all' then
			TriggerClientEvent('giveallmeleeweapon', playerId)
			TriggerClientEvent('giveallhandgunweapon', playerId)
			TriggerClientEvent('giveallsubmachineweapon', playerId)
			TriggerClientEvent('giveallshotgunweapon', playerId)
			TriggerClientEvent('giveallassaultweapon', playerId)
			TriggerClientEvent('giveallmachineweapon', playerId)
			TriggerClientEvent('giveallsniperweapon', playerId)
			TriggerClientEvent('giveallheavyweapon', playerId)
			TriggerClientEvent('giveallthrowablesweapon', playerId)	
		elseif category == 'melee' then
			TriggerClientEvent('giveallmeleeweapon', playerId)
		elseif category == 'handgun' then
			TriggerClientEvent('giveallhandgunweapon', playerId)
		elseif category == 'submachine' then
			TriggerClientEvent('giveallsubmachineweapon', playerId)
		elseif category == 'shotgun' then
			TriggerClientEvent('giveallshotgunweapon', playerId)
		elseif category == 'assault' then
			TriggerClientEvent('giveallassaultweapon', playerId)
		elseif category == 'machine' then
			TriggerClientEvent('giveallmachineweapon', playerId)
		elseif category == 'sniper' then
			TriggerClientEvent('giveallsniperweapon', playerId)
		elseif category == 'heavy' then
			TriggerClientEvent('giveallheavyweapon', playerId)	
		elseif category == 'throwables' then
			TriggerClientEvent('giveallthrowablesweapon', playerId)	
		end			
	else
		local category = args[1]
		if category == 'all' then
			TriggerClientEvent('giveallmeleeweapon', source)
			TriggerClientEvent('giveallhandgunweapon', source)
			TriggerClientEvent('giveallsubmachineweapon', source)
			TriggerClientEvent('giveallshotgunweapon', source)
			TriggerClientEvent('giveallassaultweapon', source)
			TriggerClientEvent('giveallmachineweapon', source)
			TriggerClientEvent('giveallsniperweapon', source)
			TriggerClientEvent('giveallheavyweapon', source)
			TriggerClientEvent('giveallthrowablesweapon', source)	
		elseif category == 'melee' then
			TriggerClientEvent('giveallmeleeweapon', source)
		elseif category == 'handgun' then
			TriggerClientEvent('giveallhandgunweapon', source)
		elseif category == 'submachine' then
			TriggerClientEvent('giveallsubmachineweapon', source)
		elseif category == 'shotgun' then
			TriggerClientEvent('giveallshotgunweapon', source)
		elseif category == 'assault' then
			TriggerClientEvent('giveallassaultweapon', source)
		elseif category == 'machine' then
			TriggerClientEvent('giveallmachineweapon', source)
		elseif category == 'sniper' then
			TriggerClientEvent('giveallsniperweapon', source)
		elseif category == 'heavy' then
			TriggerClientEvent('giveallheavyweapon', source)	
		elseif category == 'throwables' then
			TriggerClientEvent('giveallthrowablesweapon', source)	
		end			
	end
end)

RegisterCommand("engine", function(source, args)
	if args[2] then
		local playerId = args[1]
		local engine = args[2]
		TriggerClientEvent('engine', playerId, engine)
	else
		local engine = args[1]
		TriggerClientEvent('engine', source, engine)
	end
end)


RegisterCommand("createvehicle", function(source, args)
	if args[2] then
			local playerId = args[1]
			local vehicle = args[2]
			TriggerClientEvent('createvehicle', playerId, vehicle)
	else
			local vehicle = args[1]
			TriggerClientEvent('createvehicle', source, vehicle)
	end
end)

RegisterCommand("removevehicle", function(source, args)
	if args[1] then
			local playerId = args[1]
			TriggerClientEvent('removevehicle', playerId)
	else
			TriggerClientEvent('removevehicle', source)
	end
end)

RegisterCommand("repairvehicle", function(source, args)
	if args[1] then
			local playerId = args[1]
			TriggerClientEvent('repairvehicle', playerId)
	else
			TriggerClientEvent('repairvehicle', source)
	end
end)

RegisterCommand("engine", function(source, args)
	if args[2] then
		local playerId = args[1]
		local engine = args[2]
		TriggerClientEvent('engine', playerId, engine)
	else
		local engine = args[1]
		TriggerClientEvent('engine', source, engine)
	end
end)

RegisterCommand("opendoor", function(source, args)
	if args[2] then
		local playerId = args[1]
		if args[2] == 'all' then
			TriggerClientEvent('opendoors', playerId)
		else
			local door = tonumber(args[2])
			TriggerClientEvent('opendoor', playerId, door)
		end
	else
		if args[1] == 'all' then
			TriggerClientEvent('opendoors', source)
		else
			local door = tonumber(args[1])
			TriggerClientEvent('opendoor', source, door)
		end
	end
end)

RegisterCommand("closedoor", function(source, args)
	if args[2] then
		local playerId = args[1]
		if args[2] == 'all' then
			TriggerClientEvent('closedoors', playerId)
		else
			local door = tonumber(args[2])
			TriggerClientEvent('closedoor', playerId, door)
		end
	else
		if args[1] == 'all' then
			TriggerClientEvent('closedoors', source)
		else
			local door = tonumber(args[1])
			TriggerClientEvent('closedoor', source, door)
		end
	end
end)

RegisterCommand("openwindow", function(source, args)
	if args[2] then
		local playerId = args[1]
		if args[2] == 'all' then
			TriggerClientEvent('openwindows', playerId)
		else
			local window = tonumber(args[2])
			TriggerClientEvent('openwindow', playerId, window)
		end
	else
		if args[1] == 'all' then
			TriggerClientEvent('openwindows', source)
		else
			local window = tonumber(args[1])
			TriggerClientEvent('openwindow', source, window)
		end
	end
end)

RegisterCommand("closewindow", function(source, args)
	if args[2] then
		local playerId = args[1]
		if args[2] == 'all' then
			TriggerClientEvent('closewindows', playerId)
		else
			local window = tonumber(args[2])
			TriggerClientEvent('closewindow', playerId, window)
		end
	else
		if args[1] == 'all' then
			TriggerClientEvent('closewindows', source)
		else
			local window = tonumber(args[1])
			TriggerClientEvent('closewindow', source, window)
		end
	end
end)

RegisterCommand("lockvehicle", function(source, args)
	if args[2] then
		local playerId = args[1]
		local vehicle = args[2]
		TriggerClientEvent('lockvehicle', playerId, vehicle)
	else
		local vehicle = args[1]
		TriggerClientEvent('lockvehicle', source, vehicle)
	end
end)

RegisterCommand("unlockvehicle", function(source, args)
	if args[2] then
		local playerId = args[1]
		local vehicle = args[2]
		TriggerClientEvent('unlockvehicle', playerId, vehicle)
	else
		local vehicle = args[1]
		TriggerClientEvent('unlockvehicle', source, vehicle)
	end
end)

RegisterCommand("enablegodveh", function(source, args)
	if args[1] then
		local playerId = args[1]
		TriggerClientEvent('enablegodveh', playerId)
	else
		TriggerClientEvent('enablegodveh', source)
	end
end)

RegisterCommand("disablegodveh", function(source, args)
	if args[1] then
		local playerId = args[1]
		TriggerClientEvent('disablegodveh', playerId)
	else
		TriggerClientEvent('disablegodveh', source)
	end
end)