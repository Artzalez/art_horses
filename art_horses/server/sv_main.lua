local MisCaballos = {}
local MiComplementos = {}
local StableSlots = 5

-- Buy Horse from MRLupo
RegisterServerEvent('rlc_caballos:buyhorse')
AddEventHandler( 'rlc_caballos:buyhorse', function ( args, name )

    local _src   = source
    local _price = args['Price']
    local _level = args['Level']
    local _model = args['Model']


	TriggerEvent('redemrp:getPlayerFromId', _src, function(user)
        u_identifier = user.getIdentifier()
        u_level = user.getLevel()
        u_charid = user.getSessionVar("charid")
        u_money = user.getMoney()
    end)

    if u_money <= _price then
        TriggerClientEvent("redemrp_notification:start", _src, "You don't have enough money", 3, "error")
        return
    end

    if u_level <= _level then
        TriggerClientEvent("redemrp_notification:start", _src, "You don't have enough level", 3, "error")
        return
    end

	TriggerEvent('redemrp:getPlayerFromId', _src, function(user)
        user.removeMoney(_price)
    end)

    local Parameters = { ['identifier'] = u_identifier, ['charid'] = u_charid, ['horse'] = _model, ['type'] = "horse", ['name'] = name }
    MySQL.Async.execute("INSERT INTO stables ( `identifier`, `charid`, `vehicles`, `type`, `name`) VALUES ( @identifier, @charid, @horse, @type, @name )", Parameters)
    TriggerClientEvent("redemrp_notification:start", _src, "You got a new horse, open your menu and set default", 3, "success")

	actualizarDb(_src)

end)



---MENUS---
RegisterServerEvent('rlc_caballos:compraComplementos')
AddEventHandler('rlc_caballos:compraComplementos', function(hash,tipo,precio,nombre)
local _source = source
local _hash = hash
local _tipo = tipo
local _precio = precio
local _nombre = nombre

	TriggerEvent('redemrp:getPlayerFromId', source, function(user)
		local identifier = user.getIdentifier()
		local charid = user.getSessionVar("charid")
		if user.getMoney() >= _precio then

			MySQL.Async.fetchScalar('SELECT COUNT(1) FROM complementos_caballo WHERE `steamid`=@identifier AND `charid` =@charid AND `hash`=@hash', {
				identifier = identifier,
				charid = charid,
				hash = _hash
			}, function(comprobarComplemento)
				if comprobarComplemento >0 then
					TriggerClientEvent("redemrp_notification:start", _source, "Ya tienes este complemento", 3, "error")
				else
					MySQL.Async.execute('INSERT INTO complementos_caballo (`steamid`, `charid`,`nombre_complemento`, `tipo`, `hash`) VALUES (@steamid, @charid,@nombre_complemento, @tipo, @hash);',
					{
						steamid = identifier,
						charid = charid,
						nombre_complemento = _nombre,
						tipo = _tipo,
						hash = _hash
					}, function(rowsChanged)
					end)
					user.removeMoney(_precio)
					TriggerClientEvent("redemrp_notification:start", _source, "You bought " .. _nombre ..". Now it's on your horse menu.", 3, "success")
					actualizarAccDb(_source)
				end
			end)
		else
			TriggerClientEvent("redemrp_notification:start", _source, "You don't have enough money", 3, "error")
		end
	end)
end)


---CODIGO---

RegisterServerEvent('z00thorses:getHorse')
AddEventHandler('z00thorses:getHorse', function()
local _source = source
	TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
		local identifier = user.getIdentifier()
		local charid = user.getSessionVar("charid")
			
		MySQL.Async.fetchAll('SELECT * FROM stables WHERE `identifier`=@identifier AND `charid`=@charid AND `type`=@horses AND `default`=1;', {identifier = identifier, charid = charid, horses = 'horse'}, function(horses)
			if horses[1] ~= nil then
				print("Horse:", horses[1].id, "Name: ", horses[1].name)
				local name = horses[1].name
				local id = horses[1].id
				local horse = horses[1].vehicles
				
				TriggerClientEvent("z00thorses:spawnHorse", _source, horse, name, id, horses[1].saddle, horses[1].blanket, horses[1].mane, horses[1].tail, horses[1].bag, horses[1].bedroll, horses[1].stirups)
			end
		end)
	end)
end)

RegisterServerEvent('z00thorses:stableHorse')
AddEventHandler('z00thorses:stableHorse', function(id)
local _source = source
local _id = id
	actualizarDb(-1)
end)

RegisterServerEvent('z00thorses:newVehicle')
AddEventHandler('z00thorses:newVehicle', function(vehHash, vehType, vehName, id)
local _source = source
local _vehHash = vehHash
local _type = vehType
local _vehName = vehName
local _id = id

  if _id ~= nil then
	_source = tonumber(_id)
	print(source, 'saving vehicle for', _source, '...')
  end	
	TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
		local identifier = user.getIdentifier()
		local charid = user.getSessionVar("charid")
		
		MySQL.Async.fetchAll('SELECT * FROM stables WHERE `identifier`=@identifier AND `charid`=@charid;', {identifier = identifier, charid = charid}, function(horses)
		local count = 0
		local nChk = false
		print('Init:', nChk)
		for _ in pairs(horses) do count = count + 1 end
		if count < StableSlots then
		 if horses[1] == nil then
			nChk = true
		 else
		  for i = 1, #horses do 
			if _vehName == horses[i].name then
				nChk = false
				print('Post', _vehName, horses[i].name, nChk)
				break
			else
				nChk = true
				print('Post', _vehName, horses[i].name, nChk)
			end
		  end
		 end
		  if nChk then		
			MySQL.Async.execute('INSERT INTO stables (`identifier`, `charid`, `vehicles`, `name`, `type`) VALUES (@identifier, @charid, @vehicles, @name, @kind);',
			{
				identifier = identifier,
				charid = charid,
				vehicles = _vehHash,
				name = _vehName,
				kind = _type
			}, function(rowsChanged)
				actualizarDb(-1)
			end)

			
			TriggerClientEvent("redemrp_notification:start", _source, _type .. " " .. _vehName .. " registrado", 3, "success")
			TriggerClientEvent("z00thorses:delMount", _source)
		  else
			TriggerClientEvent("redemrp_notification:start", _source, "El nombre ya esta en uso", 3, "error")
		  end
		else
			TriggerClientEvent("redemrp_notification:start", _source, "No te queda más espacio en el establo", 3, "error")
		end
		
		end)
	end) 
end)

RegisterServerEvent('z00thorses:defVeh')
AddEventHandler('z00thorses:defVeh', function(name)
	local _source = source
	local _name = name
	TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
		local identifier = user.getIdentifier()
		local charid = user.getSessionVar("charid")

		MySQL.Async.execute("UPDATE stables SET `default`=0 WHERE `identifier`=@identifier AND `charid`=@charid AND `type`=@horses AND `default`=1", {identifier = identifier, charid = charid, horses = 'horse'}, function(done)
		end)
		Wait(200);
		MySQL.Async.execute("UPDATE stables SET `default`=1 WHERE `identifier`=@identifier AND `charid`=@charid AND `name`=@name AND `type`=@horses", {identifier = identifier, charid = charid, name = _name, horses = 'horse'}, function(rowsChanged)
		if rowsChanged == 0 then
		else
			TriggerClientEvent("redemrp_notification:start", _source, _name .. " is your default horse", 3, "success")
		end
		end)
	end)
end)


RegisterServerEvent('rlc_caballos:escogerCaballo')
AddEventHandler('rlc_caballos:escogerCaballo', function()
	local _source = source
	TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
		local identifier = user.getIdentifier()
		local charid = user.getSessionVar("charid")
		for k,item in pairs(MisCaballos) do
			if identifier == item.identifier and charid == item.charid then
				TriggerClientEvent('rlc_caballos:actualizarCaballos', _source, k, item.name, item.type)
			end
		end
	end)
end)

RegisterServerEvent('rlc_caballos:escogerComplementos')
AddEventHandler('rlc_caballos:escogerComplementos', function()
	local _source = source
	TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
		local identifier = user.getIdentifier()
		local charid = user.getSessionVar("charid")
		for k,item in pairs(MiComplementos) do
			if identifier == item.steamid and charid == item.charid then
				print(item.nombre_complemento)
				TriggerClientEvent('rlc_caballos:actualizarComplementos', _source, k, item.nombre_complemento, item.tipo, item.hash)
			end
		end
	end)
end)

RegisterServerEvent('rlc_caballos:liberarCaballo')
AddEventHandler('rlc_caballos:liberarCaballo', function(caballoActual)
	TriggerEvent('redemrp:getPlayerFromId', source, function(user)
		local identifier = user.getIdentifier()
		local charid = user.getSessionVar("charid")
		print(caballoActual)
		TriggerClientEvent("redemrp_notification:start", source, "Free this Horse", 3, "success")
		MySQL.Async.execute("DELETE FROM stables WHERE `identifier`=@identifier AND `charid`=@charid AND `id`=@id AND `default`=1", {identifier = identifier, charid = charid, id=caballoActual}, function(rowsChanged)
			actualizarDb(-1)
		end)
	end)
end)

RegisterServerEvent('rlc_caballos:colocarComplementos')
AddEventHandler('rlc_caballos:colocarComplementos', function(hash, tipo, hid)
	local _source = source
	TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
		local identifier = user.getIdentifier()
		local charid = user.getSessionVar("charid")
		print(hash)
		print(tipo)
		MySQL.Async.execute("UPDATE stables SET `" .. tipo .."`=@hash WHERE id=@id", { hash = hash, id = hid}, function(rowsChanged)
		end)
		TriggerClientEvent("redemrp_notification:start", source, "Accessorie saved in this horse", 3, "success")
	end)
end)

AddEventHandler('redemrp:playerLoaded', function(source, user)
	Wait(5000)
	TriggerEvent('redemrp:getPlayerFromId', source, function(user)
		local identifier = user.getIdentifier()
		local charid = user.getSessionVar("charid")
		-- caballos
		for k,item in pairs(MisCaballos) do
			if identifier == item.identifier and charid == item.charid then
				TriggerClientEvent('rlc_caballos:actualizarCaballos', source, k, item.name, item.type)
				print(item.name)
			end
		end
		-- accesorios
		for k,item in pairs(MiComplementos) do
			if identifier == item.identifier and charid == item.charid then
				TriggerClientEvent('rlc_caballos:actualizarComplementos', source, k, item.nombre_complemento, item.tipo, item.hash)
				print(item.nombre_complemento .. " de " .. item.nombre_complemento)
			end
		end
	end)
end)

function actualizarDb(src) 
	MySQL.ready(function ()
		MisCaballos = {}
        MySQL.Async.fetchAll('SELECT * FROM stables', {}, function(caballos)
            for k, v in ipairs(caballos) do
                MisCaballos[v.id] = {
                    ['identifier'] = v.identifier,
                    ['charid'] = v.charid,
                    ['name'] = v.name,
                    ['type'] = v.type
				}
				print(v.name)
			end
		end)
		Wait(1000)
		TriggerClientEvent('rlc_caballos:forzarActualizar', src)
    end)
end

function actualizarAccDb(src) 
	MySQL.ready(function ()
		MiComplementos = {}
        MySQL.Async.fetchAll('SELECT * FROM complementos_caballo', {}, function(complementos)
            for k, v in ipairs(complementos) do
                MiComplementos[v.id] = {
                    ['steamid'] = v.steamid,
                    ['charid'] = v.charid,
                    ['nombre_complemento'] = v.nombre_complemento,
					['tipo'] = v.tipo,
					['hash'] = v.hash
				}
			end
		end)
		Wait(1000)
		TriggerClientEvent('rlc_caballos:forzarActualizar2', src)
    end)
end

AddEventHandler('onResourceStart', function (resourceName)
    if(GetCurrentResourceName() ~= resourceName) then
      return
    end
    MySQL.ready(function()
		actualizarDb(-1)
		actualizarAccDb(-1)
		print('Horses Loaded')
    end)
end)