function GetEntityInDirection(entFrom, coordFrom, coordTo)
	local rayHandle = StartShapeTestCapsule(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 5.0, 10, entFrom, 7)
    local _,_,_,_,entity = GetShapeTestResult(rayHandle)
    return entity
end

RegisterCommand("getcoords", function(source, args)
	if args[1] then
		local playerId = GetPlayerFromServerId(args[1])
		local ped = GetPlayerPed(playerId)
		print(GetEntityCoords(ped))
	else
		local ped = PlayerPedId()
		print(GetEntityCoords(ped))
	end
end)

RegisterNetEvent('setcoords')
AddEventHandler('setcoords', function(x,y,z)
	local ped = PlayerPedId()
	local pedVehicle = GetVehiclePedIsIn(ped)
	SetPedCoordsKeepVehicle(ped, x, y, z)
end)

RegisterNetEvent('tp')
AddEventHandler('tp', function(targetplayerId)
	local ped = PlayerPedId()
	local target = GetPlayerFromServerId(targetplayerId)
	local targetped = GetPlayerPed(target)
	local targetpedvehicle = GetVehiclePedIsIn(targetped)
	local targetpedcoords = GetEntityCoords(targetped)
	if NetworkPlayerGetName(target) ~= '**Invalid**' then
		if IsPedSittingInAnyVehicle(targetped) then
			SetPedIntoVehicle(ped, targetpedvehicle, -2)
		else
			SetPedCoordsKeepVehicle(ped, targetpedcoords.x, targetpedcoords.y, targetpedcoords.z)
		end
	end
end)

RegisterCommand("tpm", function(source, args)
	local ped = PlayerPedId()
	local waypoint = GetFirstBlipInfoId(8)
    local waypointCoords = GetBlipInfoIdCoord(waypoint)
--	if waypoint ~= 0 then
    SetPedCoordsKeepVehicle(ped, waypointCoords.x, waypointCoords.y, waypointCoords.z)
--	end
end)

RegisterNetEvent('setped')
AddEventHandler('setped', function(model)
	local ped = PlayerPedId()
	local hash = GetHashKey(model)
	RequestModel(hash)
	while not HasModelLoaded(hash) do
		RequestModel(hash)
		Citizen.Wait(0)
	end
		SetPlayerModel(PlayerId(), hash)
		exports.noclipper:novoped()
end)

RegisterNetEvent('togglegodmode')
AddEventHandler('togglegodmode', function()
	local ped = PlayerPedId()
	local invincible = GetPlayerInvincible()
	local switch = not invincible
	SetEntityInvincible(ped, switch)
end)

RegisterNetEvent('sethealth')
AddEventHandler('sethealth', function(health)
	local ped = PlayerPedId()
	SetEntityHealth(ped, health)
end)

RegisterNetEvent('setarmour')
AddEventHandler('setarmour', function(armour)
	local ped = PlayerPedId()
	SetPedArmour(ped, armour)
end)

RegisterNetEvent('setwantedlevel')
AddEventHandler('setwantedlevel', function(level)
	local ped = PlayerPedId()
	SetPlayerWantedLevel(PlayerId(), level, false)
end)

RegisterNetEvent('giveweapon')
AddEventHandler('giveweapon', function(weaponHash)
	local ped = PlayerPedId()
	GiveWeaponToPed(ped, weaponHash, 999, false, false)
end)

RegisterNetEvent('removeweapon')
AddEventHandler('removeweapon', function(weaponHash)
	local ped = PlayerPedId()
	RemoveWeaponFromPed(ped, weaponHash)
end)

RegisterNetEvent('removeweapons')
AddEventHandler('removeweapons', function()
	local ped = PlayerPedId()
	RemoveAllPedWeapons(ped)
end)

RegisterNetEvent('givecomponentweapon')
AddEventHandler('givecomponentweapon', function(weaponHash, componentHash)
	local ped = PlayerPedId()
	GiveWeaponComponentToPed(ped, weaponHash, componentHash)
end)

RegisterNetEvent('removecomponentweapon')
AddEventHandler('removecomponentweapon', function(weaponHash, componentHash)
	local ped = PlayerPedId()
	RemoveWeaponComponentFromPed(ped, weaponHash, componentHash)
end)

RegisterNetEvent('setweapontint')
AddEventHandler('setweapontint', function(weaponHash, tint)
	local ped = PlayerPedId()
	SetPedWeaponTintIndex(ped, weaponHash, tint)
end)

RegisterNetEvent('setammoweapon')
AddEventHandler('setammoweapon', function(weaponHash, ammo)
	local ped = PlayerPedId()
	SetPedAmmo(ped, weaponHash, ammo)
end)

RegisterNetEvent('addammoweapon')
AddEventHandler('addammoweapon', function(weaponHash, ammo)
	local ped = PlayerPedId()
	AddAmmoToPed(ped, weaponHash, ammo)
end)

RegisterNetEvent('enableinfiniteclipammo')
AddEventHandler('enableinfiniteclipammo', function()
	local ped = PlayerPedId()
	SetPedInfiniteAmmoClip(ped, true)
end)

RegisterNetEvent('disableinfiniteclipammo')
AddEventHandler('disableinfiniteclipammo', function()
	local ped = PlayerPedId()
	SetPedInfiniteAmmoClip(ped, false)
end)

RegisterNetEvent('giveallmeleeweapon')
AddEventHandler('giveallmeleeweapon', function()
	local ped = PlayerPedId()
	GiveWeaponToPed(ped, GetHashKey('weapon_dagger'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_bat'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_bottle'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_crowbar'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_flashlight'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_golfclub'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_hammer'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_hatchet'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_knuckle'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_knife'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_machete'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_switchblade'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_nightstick'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_wrench'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_battleaxe'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_poolcue'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_stone_hatchet'), 9999, false, false)
end)

RegisterNetEvent('giveallhandgunweapon')
AddEventHandler('giveallhandgunweapon', function()
	local ped = PlayerPedId()
	GiveWeaponToPed(ped, GetHashKey('weapon_pistol'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_pistol_mk2'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_combatpistol'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_appistol'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_stungun'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_pistol50'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_snspistol'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_snspistol_mk2'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_heavypistol'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_vintagepistol'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_flaregun'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_marksmanpistol'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_revolver'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_revolver_mk2'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_doubleaction'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_raypistol'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_ceramicpistol'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_navyrevolver'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_gadgetpistol'), 9999, false, false)
end)

RegisterNetEvent('giveallsubmachineweapon')
AddEventHandler('giveallsubmachineweapon', function()
	local ped = PlayerPedId()
	GiveWeaponToPed(ped, GetHashKey('weapon_microsmg'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_smg'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_smg_mk2'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_assaultsmg'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_combatpdw'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_machinepistol'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_minismg'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_raycarbine'), 9999, false, false)
end)

RegisterNetEvent('giveallshotgunweapon')
AddEventHandler('giveallshotgunweapon', function()
	local ped = PlayerPedId()
	GiveWeaponToPed(ped, GetHashKey('weapon_pumpshotgun'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_pumpshotgun_mk2'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_sawnoffshotgun'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_assaultshotgun'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_bullpupshotgun'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_musket'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_heavyshotgun'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_dbshotgun'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_autoshotgun'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_combatshotgun2'), 9999, false, false)
end)

RegisterNetEvent('giveallassaultweapon')
AddEventHandler('giveallassaultweapon', function()
	local ped = PlayerPedId()
	GiveWeaponToPed(ped, GetHashKey('weapon_assaultrifle'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_assaultrifle_mk2'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_carbinerifle'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_carbinerifle_mk2'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_advancedrifle'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_specialcarbine'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_specialcarbine_mk2'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_bullpuprifle'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_bullpuprifle_mk2'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_compactrifle'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_militaryrifle'), 9999, false, false)
end)

RegisterNetEvent('giveallmachineweapon')
AddEventHandler('giveallmachineweapon', function()
	local ped = PlayerPedId()
	GiveWeaponToPed(ped, GetHashKey('weapon_mg'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_combatmg'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_combatmg_mk2'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_gusenberg'), 9999, false, false)
end)

RegisterNetEvent('giveallsniperweapon')
AddEventHandler('giveallsniperweapon', function()
	local ped = PlayerPedId()
	GiveWeaponToPed(ped, GetHashKey('weapon_sniperrifle'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_heavysniper'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_heavysniper_mk2'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_marksmanrifle'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_marksmanrifle_mk2'), 9999, false, false)
end)

RegisterNetEvent('giveallheavyweapon')
AddEventHandler('giveallheavyweapon', function()
	local ped = PlayerPedId()
	GiveWeaponToPed(ped, GetHashKey('weapon_rpg'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_grenadelauncher'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_grenadelauncher_smoke'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_minigun'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_firework'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_railgun'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_hominglauncher'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_compactlauncher'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_rayminigun'), 9999, false, false)
end)

RegisterNetEvent('giveallthrowablesweapon')
AddEventHandler('giveallthrowablesweapon', function()
	local ped = PlayerPedId()
	GiveWeaponToPed(ped, GetHashKey('weapon_grenade'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_bzgas'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_molotov'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_stickybomb'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_proxmine'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_snowball'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_pipebomb'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_ball'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_smokegrenade'), 9999, false, false)
	GiveWeaponToPed(ped, GetHashKey('weapon_flare'), 9999, false, false)
end)

RegisterNetEvent('createvehicle')
AddEventHandler('createvehicle', function(vehicle)
	RequestModel(vehicle)
    while not HasModelLoaded(vehicle) do
        Wait(500)
    end
    local ped = PlayerPedId()
    local pedPos = GetEntityCoords(ped)
    if IsPedSittingInAnyVehicle(ped) then
        TriggerEvent('removevehicle')
    end
    local vehicle = CreateVehicle(vehicle, pedPos.x, pedPos.y, pedPos.z, GetEntityHeading(ped), true, false)
    SetPedIntoVehicle(ped, vehicle, -1)
    SetEntityAsNoLongerNeeded(vehicle)
    SetModelAsNoLongerNeeded(vehicle)
end)

RegisterNetEvent('removevehicle')
AddEventHandler('removevehicle', function(front)
	local ped = PlayerPedId()
	local pedVehicle = GetVehiclePedIsIn(ped)
	if IsPedSittingInAnyVehicle(ped) and GetPedInVehicleSeat(pedVehicle, -1) == ped then
		DeleteEntity(pedVehicle)
	else
		local pedPos = GetEntityCoords(ped)
		local inFrontOfPlayerDirection = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.0, 0.0 )
		local inFrontOfPlayerEntity = GetEntityInDirection(ped, pedPos, inFrontOfPlayerDirection)
		if IsEntityAVehicle(inFrontOfPlayerEntity) then 
			DeleteEntity(inFrontOfPlayerEntity)
		end
	end
end)

RegisterNetEvent('repairvehicle')
AddEventHandler('repairvehicle', function()
	local ped = PlayerPedId()
	local pedVehicle = GetVehiclePedIsIn(ped)
	SetVehicleEngineHealth(pedVehicle, 1000)
	SetVehiclePetrolTankHealth(pedVehicle, 1000)
    SetVehicleBodyHealth(pedVehicle, 1000)
	SetVehicleFixed(pedVehicle)
end)

RegisterNetEvent('engine')
AddEventHandler('engine', function(engine)
	local ped = PlayerPedId()
	local pedVehicle = GetVehiclePedIsIn(ped)
	if engine == 'off' then
		motor = false
		autostart = true
	else
		motor = true
		autostart = false
	end
	SetVehicleEngineOn(pedVehicle, motor, false, autostart)
end)

RegisterNetEvent('opendoor')
AddEventHandler('opendoor', function(door)
	local ped = PlayerPedId()
	local pedVehicle = GetVehiclePedIsIn(ped)
	SetVehicleDoorOpen(pedVehicle, door, true, false)
end)

RegisterNetEvent('opendoors')
AddEventHandler('opendoors', function()
	local ped = PlayerPedId()
	local pedVehicle = GetVehiclePedIsIn(ped)
	SetVehicleDoorOpen(pedVehicle, 0, true, false)
	SetVehicleDoorOpen(pedVehicle, 1, true, false)
	SetVehicleDoorOpen(pedVehicle, 2, true, false)
	SetVehicleDoorOpen(pedVehicle, 3, true, false)
	SetVehicleDoorOpen(pedVehicle, 4, true, false)
	SetVehicleDoorOpen(pedVehicle, 5, true, false)
	SetVehicleDoorOpen(pedVehicle, 6, true, false)
	SetVehicleDoorOpen(pedVehicle, 7, true, false)
end)

RegisterNetEvent('closedoor')
AddEventHandler('closedoor', function(door)
	local ped = PlayerPedId()
	local pedVehicle = GetVehiclePedIsIn(ped)
	SetVehicleDoorShut(pedVehicle, door, false)
end)

RegisterNetEvent('closedoors')
AddEventHandler('closedoors', function()
	local ped = PlayerPedId()
	local pedVehicle = GetVehiclePedIsIn(ped)
	SetVehicleDoorsShut(pedVehicle, false)
end)

RegisterNetEvent('openwindow')
AddEventHandler('openwindow', function(window)
	local ped = PlayerPedId()
	local pedVehicle = GetVehiclePedIsIn(ped)
	RollDownWindow(pedVehicle, window)
end)

RegisterNetEvent('openwindows')
AddEventHandler('openwindows', function()
	local ped = PlayerPedId()
	local pedVehicle = GetVehiclePedIsIn(ped)
	RollDownWindows(pedVehicle)
end)

RegisterNetEvent('closewindow')
AddEventHandler('closewindow', function(window)
	local ped = PlayerPedId()
	local pedVehicle = GetVehiclePedIsIn(ped)
	RollUpWindow(pedVehicle, window)
end)

RegisterNetEvent('closewindows')
AddEventHandler('closewindows', function()
	local ped = PlayerPedId()
	local pedVehicle = GetVehiclePedIsIn(ped)
	RollUpWindow(pedVehicle, 0)
	RollUpWindow(pedVehicle, 1)
	RollUpWindow(pedVehicle, 2)
	RollUpWindow(pedVehicle, 3)
	RollUpWindow(pedVehicle, 4)
	RollUpWindow(pedVehicle, 5)
	RollUpWindow(pedVehicle, 6)
	RollUpWindow(pedVehicle, 7)
end)

RegisterNetEvent('lockvehicle')
AddEventHandler('lockvehicle', function(engine)
	local ped = PlayerPedId()
	local pedVehicle = GetVehiclePedIsIn(ped)
	SetVehicleDoorsLocked(pedVehicle, 2)
	SetVehicleAlarm(pedVehicle, true)
	SetVehicleAlarmTimeLeft(pedVehicle, 900000)
end)

RegisterNetEvent('unlockvehicle')
AddEventHandler('unlockvehicle', function(engine)
	local ped = PlayerPedId()
	local pedPos = GetEntityCoords(ped)
	local inFrontOfPlayerDirection = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.0, 0.0 )
    local inFrontOfPlayerEntity = GetEntityInDirection(ped, pedPos, inFrontOfPlayerDirection)
    if IsEntityAVehicle(inFrontOfPlayerEntity) then 
        SetVehicleDoorsLocked(inFrontOfPlayerEntity, 1)
    end
end)

RegisterCommand('createhook', function(source, args)
	local ped = PlayerPedId()
	local pedveh = GetVehiclePedIsUsing(ped)
	CreatePickUpRopeForCargobob(pedveh,1)
end, false)

RegisterCommand('removehook', function(source, args)
	local ped = PlayerPedId()
	local pedveh = GetVehiclePedIsUsing(ped)
	local vehatt = GetVehicleAttachedToCargobob(pedveh)
	DetachVehicleFromAnyCargobob(vehatt)
	RemovePickUpRopeForCargobob(pedveh)
end, false)

RegisterNetEvent('enablegodveh')
AddEventHandler('enablegodveh', function()
	local ped = PlayerPedId()
	local pedveh = GetVehiclePedIsUsing(ped)
	SetEntityInvincible(pedveh, true)
	SetDisableVehicleWindowCollisions(pedveh, true)
end)

RegisterNetEvent('disablegodveh')
AddEventHandler('disablegodveh', function()
	local ped = PlayerPedId()
	local pedveh = GetVehiclePedIsUsing(ped)
	SetEntityInvincible(pedveh, false)
	SetDisableVehicleWindowCollisions(pedveh, false)
end)

RegisterCommand('licenseplate', function(source, args, rawCommand)
    local ped = PlayerPedId()
    local licenseplate = args[1]
    if licenseplate ~= nil then
    	local veh = GetVehiclePedIsIn(ped)
    	if veh ~= 0 then
            local driver = GetPedInVehicleSeat(veh, -1)

            if driver == ped then 
    		SetVehicleNumberPlateText(veh, licenseplate)
            end
        end
    end
end)

-- repair vehicle ped is in
RegisterCommand('repair', function(source, args, rawCommand)
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped)
    if veh ~= 0 then
        local driver = GetPedInVehicleSeat(veh, -1)

        if driver == ped then 
            SetVehicleFixed(veh)
        end
    end
end)

-- SetSuperJumpThisFrame
RegisterCommand('superjump', function(source, args, rawCommand)
    local ped = PlayerId()
    -- if jump is not defined, then define it else remove it
    if jump then
        jump = false
    else
        jump = true
    end
    Citizen.CreateThread(function()
        while jump do
            Citizen.Wait(0)
            SetSuperJumpThisFrame(ped)
        end
    end)
end)
