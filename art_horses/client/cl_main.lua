local myHorse = {0, 0, 0, 0}
local playerPed = PlayerPedId()
local isOpen = false
MisCaballos = {}
MisComplementos = {}

----MENU COMPLEMENTOS CABALLOS
Citizen.CreateThread(function()
	WarMenu.CreateMenu('menu_complementos', Config.Language["menuComplementsTitle"])
	WarMenu.SetSubTitle('menu_complementos', Config.Language["menuComplementsSubTitle"])

		--Menu Caballos-
		WarMenu.CreateSubMenu('menu_complementos_caballos', 'menu_complementos', Config.Language["subMenuComplementsHorsesTitle"])
		WarMenu.SetSubTitle('menu_complementos_caballos', Config.Language["subMenuComplementsHorsesSubTitle"])

			WarMenu.CreateSubMenu('menu_complementos_caballos_sillas', 'menu_complementos_caballos', Config.Menu[1].Text)
			WarMenu.CreateSubMenu('menu_complementos_caballos_mantas', 'menu_complementos_caballos', Config.Menu[2].Text)
			WarMenu.CreateSubMenu('menu_complementos_caballos_crines', 'menu_complementos_caballos', Config.Menu[3].Text)
			WarMenu.CreateSubMenu('menu_complementos_caballos_colas', 'menu_complementos_caballos', Config.Menu[4].Text)
			WarMenu.CreateSubMenu('menu_complementos_caballos_alforjas', 'menu_complementos_caballos', Config.Menu[5].Text)
			WarMenu.CreateSubMenu('menu_complementos_caballos_petates', 'menu_complementos_caballos', Config.Menu[6].Text)
			WarMenu.CreateSubMenu('menu_complementos_caballos_estribos', 'menu_complementos_caballos', Config.Menu[7].Text)

		--Menu Carros feature

--[[
		WarMenu.CreateSubMenu('menu_complementos_carros', 'menu_complementos', 'Carros')
		WarMenu.SetSubTitle('menu_complementos_carros', 'Menu de carros')
		
			WarMenu.CreateSubMenu('menu_monturas_carros_opciones', 'menu_monturas_carros', 'Opciones de carros')
			WarMenu.CreateSubMenu('menu_monturas_carros_base', 'menu_monturas_carros', 'Escoje tu carro')
			WarMenu.CreateSubMenu('menu_monturas_carros_complementos', 'menu_monturas_carros', 'Escoje tus complementos de carro')
]]
			while true do
				local ped = GetPlayerPed(-1)
				local coords = GetEntityCoords(PlayerPedId())
		
				if WarMenu.IsMenuOpened('menu_complementos') then
					if WarMenu.MenuButton(Config.Language["subMenuComplementsHorsesTitle"], 'menu_complementos_caballos') then
						
					end
--[[ Mostar menu complementos carros
					if WarMenu.MenuButton('Carros', 'menu_complementos_carros') then
						
					end
]]
					WarMenu.Display()
					
				elseif WarMenu.IsMenuOpened('menu_complementos_caballos') then
					if WarMenu.MenuButton(Config.Menu[1].Text, 'menu_complementos_caballos_sillas') then

						WarMenu.OpenMenu('menu_complementos_caballos_sillas')
									
					elseif WarMenu.MenuButton(Config.Menu[2].Text, 'menu_complementos_caballos_mantas') then

						WarMenu.OpenMenu('menu_complementos_caballos_mantas')

					elseif WarMenu.MenuButton(Config.Menu[3].Text, 'menu_complementos_caballos_crines') then
						
						WarMenu.OpenMenu('menu_complementos_caballos_crines')

					elseif WarMenu.MenuButton(Config.Menu[4].Text, 'menu_complementos_caballos_colas') then
						
						WarMenu.OpenMenu('menu_complementos_caballos_colas')

					elseif WarMenu.MenuButton(Config.Menu[5].Text, 'menu_complementos_caballos_alforjas') then
						
						WarMenu.OpenMenu('menu_complementos_caballos_alforjas')

					elseif WarMenu.MenuButton(Config.Menu[6].Text, 'menu_complementos_caballos_petates') then
						
						WarMenu.OpenMenu('menu_complementos_caballos_petates')

					elseif WarMenu.MenuButton(Config.Menu[7].Text, 'menu_complementos_caballos_estribos') then
						
						WarMenu.OpenMenu('menu_complementos_caballos_estribos')

					end
					WarMenu.Display()

--[[ Componentes Carros		FEATURE
				elseif WarMenu.IsMenuOpened('menu_complementos_carros') then
					if WarMenu.MenuButton('Opciones de carros', 'menu_monturas_carros_opciones') then
								
					elseif WarMenu.MenuButton('Escoje a tu carro', 'menu_monturas_carros_base') then
								 
					elseif WarMenu.MenuButton('Escoje tus complementos de carro', 'menu_monturas_carros_complementos') then
								 
					end
					WarMenu.Display()     
]]      
				end
				Citizen.Wait(0)
			end
		end)
		
--Sillas
Citizen.CreateThread( function()
	WarMenu.CreateSubMenu('menu_complementos_caballos_sillas','menu_complementos_caballos', Config.Menu[1].Text)
	repeat
		if WarMenu.IsMenuOpened('menu_complementos_caballos_sillas') then
			for i = 1, #Config.MenuSillas do
				if WarMenu.Button(Config.MenuSillas[i]['Text'] .. " ~t6~$" .. Config.MenuSillas[i]['Param'].Precio, Config.MenuSillas[i]['SubText'], Config.MenuSillas[i]['Desc']) then
					
					TriggerServerEvent("rlc_caballos:compraComplementos",Config.MenuSillas[i]['Param'].Hash,1,Config.MenuSillas[i]['Param'].Precio,Config.MenuSillas[i].Text)
					Citizen.InvokeNative(0xD3A7B003ED343FD9, myHorse[4],Config.MenuSillas[i]['Param'].Hash,true,true,true)
				end
			end
			WarMenu.Display()
		end
		Citizen.Wait(1)
	until false
end)

--Mantas
Citizen.CreateThread( function()
	WarMenu.CreateSubMenu('menu_complementos_caballos_mantas','menu_complementos_caballos', Config.Menu[2].Text)
	repeat
		if WarMenu.IsMenuOpened('menu_complementos_caballos_mantas') then
			for i = 1, #Config.MenuMantas do
				if WarMenu.Button(Config.MenuMantas[i]['Text'] .. " ~t6~$" .. Config.MenuMantas[i]['Param'].Precio, Config.MenuMantas[i]['SubText'], Config.MenuMantas[i]['Desc']) then
					TriggerServerEvent("rlc_caballos:compraComplementos",Config.MenuMantas[i]['Param'].Hash,2,Config.MenuMantas[i]['Param'].Precio,Config.MenuMantas[i].Text)
					Citizen.InvokeNative(0xD3A7B003ED343FD9, myHorse[4],Config.MenuMantas[i]['Param'].Hash,true,true,true)
				end
			end
			WarMenu.Display()
		end
		Citizen.Wait(1)
	until false
end)

--Crin
Citizen.CreateThread( function()
	WarMenu.CreateSubMenu('menu_complementos_caballos_crines','menu_complementos_caballos', Config.Menu[3].Text)
	repeat
		if WarMenu.IsMenuOpened('menu_complementos_caballos_crines') then
			for i = 1, #Config.MenuCrines do
				if WarMenu.Button(Config.MenuCrines[i]['Text'] .. " ~t6~$" .. Config.MenuCrines[i]['Param'].Precio, Config.MenuCrines[i]['SubText'], Config.MenuCrines[i]['Desc']) then
					TriggerServerEvent("rlc_caballos:compraComplementos",Config.MenuCrines[i]['Param'].Hash,3,Config.MenuCrines[i]['Param'].Precio,Config.MenuCrines[i].Text)
					Citizen.InvokeNative(0xD3A7B003ED343FD9, myHorse[4],Config.MenuCrines[i]['Param'].Hash,true,true,true)
				end
			end
			WarMenu.Display()
		end
		Citizen.Wait(1)
	until false
end)

--Colas
Citizen.CreateThread( function()
	WarMenu.CreateSubMenu('menu_complementos_caballos_colas','menu_complementos_caballos', Config.Menu[4].Text)
	repeat
		if WarMenu.IsMenuOpened('menu_complementos_caballos_colas') then
			for i = 1, #Config.MenuColas do
				if WarMenu.Button(Config.MenuColas[i]['Text'] .. " ~t6~$" .. Config.MenuColas[i]['Param'].Precio, Config.MenuColas[i]['SubText'], Config.MenuColas[i]['Desc']) then
					TriggerServerEvent("rlc_caballos:compraComplementos",Config.MenuColas[i]['Param'].Hash,4,Config.MenuColas[i]['Param'].Precio,Config.MenuColas[i].Text)
					Citizen.InvokeNative(0xD3A7B003ED343FD9, myHorse[4],Config.MenuColas[i]['Param'].Hash,true,true,true)
				end
			end
			WarMenu.Display()
		end
		Citizen.Wait(1)
	until false
end)

--Alforjas
Citizen.CreateThread( function()
	WarMenu.CreateSubMenu('menu_complementos_caballos_alforjas','menu_complementos_caballos', Config.Menu[5].Text)
	repeat
		if WarMenu.IsMenuOpened('menu_complementos_caballos_alforjas') then
			for i = 1, #Config.MenuAlforjas do
				if WarMenu.Button(Config.MenuAlforjas[i]['Text'] .. " ~t6~$" .. Config.MenuAlforjas[i]['Param'].Precio, Config.MenuAlforjas[i]['SubText'], Config.MenuAlforjas[i]['Desc']) then
					TriggerServerEvent("rlc_caballos:compraComplementos",Config.MenuAlforjas[i]['Param'].Hash,5,Config.MenuAlforjas[i]['Param'].Precio,Config.MenuAlforjas[i].Text)
					Citizen.InvokeNative(0xD3A7B003ED343FD9, myHorse[4],Config.MenuAlforjas[i]['Param'].Hash,true,true,true)
				end
			end
			WarMenu.Display()
		end
		Citizen.Wait(1)
	until false
end)

--Petates
Citizen.CreateThread( function()
	WarMenu.CreateSubMenu('menu_complementos_caballos_petates','menu_complementos_caballos', Config.Menu[6].Text)
	repeat
		if WarMenu.IsMenuOpened('menu_complementos_caballos_petates') then
			for i = 1, #Config.MenuPetates do
				if WarMenu.Button(Config.MenuPetates[i]['Text'] .. " ~t6~$" .. Config.MenuPetates[i]['Param'].Precio, Config.MenuPetates[i]['SubText'], Config.MenuPetates[i]['Desc']) then
					TriggerServerEvent("rlc_caballos:compraComplementos",Config.MenuPetates[i]['Param'].Hash,6,Config.MenuPetates[i]['Param'].Precio,Config.MenuPetates[i].Text)
					Citizen.InvokeNative(0xD3A7B003ED343FD9, myHorse[4],Config.MenuPetates[i]['Param'].Hash,true,true,true)
				end
			end
			WarMenu.Display()
		end
		Citizen.Wait(1)
	until false
end)

--Estribos
Citizen.CreateThread( function()
	WarMenu.CreateSubMenu('menu_complementos_caballos_estribos','menu_complementos_caballos', Config.Menu[7].Text)
	repeat
		if WarMenu.IsMenuOpened('menu_complementos_caballos_estribos') then
			for i = 1, #Config.MenuEstribos do
				if WarMenu.Button(Config.MenuEstribos[i]['Text'] .. " ~t6~$" .. Config.MenuEstribos[i]['Param'].Precio, Config.MenuEstribos[i]['SubText'], Config.MenuEstribos[i]['Desc']) then
					TriggerServerEvent("rlc_caballos:compraComplementos",Config.MenuEstribos[i]['Param'].Hash,7,Config.MenuEstribos[i]['Param'].Precio,Config.MenuEstribos[i].Text)
					Citizen.InvokeNative(0xD3A7B003ED343FD9, myHorse[4],Config.MenuEstribos[i]['Param'].Hash,true,true,true)
				end
			end
			WarMenu.Display()
		end
		Citizen.Wait(1)
	until false
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		for _, st in pairs(Config.Coords) do
			local betweencoords = GetDistanceBetweenCoords(coords, st.x, st.y, st.z, true)
			if betweencoords < 3.0 then
				local isOpenMenuPp = WarMenu.IsMenuOpened('menu_complementos') 
				local isOpenMenuCa = WarMenu.IsMenuOpened('menu_complementos_caballos') 
				local isOpenMenuSi = WarMenu.IsMenuOpened('menu_complementos_caballos_sillas') 
				local isOpenMenuMa = WarMenu.IsMenuOpened('menu_complementos_caballos_mantas') 
				local isOpenMenuCr = WarMenu.IsMenuOpened('menu_complementos_caballos_crines') 
				local isOpenMenuCo = WarMenu.IsMenuOpened('menu_complementos_caballos_colas') 
				local isOpenMenuAl = WarMenu.IsMenuOpened('menu_complementos_caballos_alforjas') 
				local isOpenMenuPe = WarMenu.IsMenuOpened('menu_complementos_caballos_petates') 
				local isOpenMenuEs = WarMenu.IsMenuOpened('menu_complementos_caballos_estribos') 
				if isOpenMenuPp == false and isOpenMenuCa == false and isOpenMenuSi == false and isOpenMenuMa == false and isOpenMenuCr == false and isOpenMenuCo == false and isOpenMenuAl == false and isOpenMenuPe == false and isOpenMenuEs == false then
					DrawTxt(Config.Texto, 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
					if IsControlJustPressed(2, 0xC7B5340A) then
						Wait(300)
						WarMenu.OpenMenu('menu_complementos')
						Wait(300)
					end
				end
			end
		end
	end
end)


---MENU MONTURAS---

Citizen.CreateThread(function()  
	while true do
		if IsControlJustReleased(0, Config.OpenKeyMenu) then --Z
			WarMenu.OpenMenu('menu_monturas')
		end
		Citizen.Wait(1)
	end
end)

Citizen.CreateThread(function()

	--MenuPrincipal--
    WarMenu.CreateMenu('menu_monturas', Config.Language["menuMountsTitle"])
	WarMenu.SetSubTitle('menu_monturas', Config.Language["menuMountsSubTitle"])

		--Menu Caballos-
		WarMenu.CreateSubMenu('menu_monturas_caballos', 'menu_monturas', Config.Language["menuMountsHorsesTitle"])
		WarMenu.SetSubTitle('menu_monturas_caballos', Config.Language["menuMountsHorsesSubTitle"])

			WarMenu.CreateSubMenu('menu_monturas_caballos_opciones', 'menu_monturas_caballos', Config.Language["menuMountsHorsesSubTitle"])
			WarMenu.CreateSubMenu('menu_monturas_caballos_base', 'menu_monturas_caballos', Config.Language["optionSelectYourHorse"])
			WarMenu.CreateSubMenu('menu_monturas_caballos_complementos', 'menu_monturas_caballos', Config.Language["subMenuComplementsHorsesSubTitle"])

		--Menu Carros.. FEATURE
		--WarMenu.CreateSubMenu('menu_monturas_carros', 'menu_monturas', 'Carros')
		--WarMenu.SetSubTitle('menu_monturas_carros', 'Menu de carros')
		
		--	WarMenu.CreateSubMenu('menu_monturas_carros_opciones', 'menu_monturas_carros', 'Opciones del carro')
		--	WarMenu.CreateSubMenu('menu_monturas_carros_base', 'menu_monturas_carros', 'Escoje tu carro')
		--	WarMenu.CreateSubMenu('menu_monturas_carros_complementos', 'menu_monturas_carros', 'Escoje los complementos del carro')


    while true do
        local ped = GetPlayerPed(-1)
        local coords = GetEntityCoords(PlayerPedId())

        if WarMenu.IsMenuOpened('menu_monturas') then
			if WarMenu.MenuButton(Config.Language["subMenuComplementsHorsesTitle"], 'menu_monturas_caballos') then
				
            end
			--if WarMenu.MenuButton('Carros', 'menu_monturas_carros') thenmenuMountsHorsesSubTitle
				
           -- end
			WarMenu.Display()
			
        elseif WarMenu.IsMenuOpened('menu_monturas_caballos') then
			if WarMenu.MenuButton(Config.Language["menuMountsHorsesSubTitle"], 'menu_monturas_caballos_opciones') then
				
				WarMenu.OpenMenu('menu_complementos_caballos_opciones')
				
            elseif WarMenu.MenuButton(Config.Language["optionSelectYourHorse"], 'menu_monturas_caballos_base') then
                         
            elseif WarMenu.MenuButton(Config.Language["optionSelectYourHorseAccessories"], 'menu_monturas_caballos_complementos') then
                         
			end
			WarMenu.Display()

		--elseif WarMenu.IsMenuOpened('menu_monturas_carros') then
        --    if WarMenu.MenuButton('Opciones de carros', 'menu_monturas_carros_opciones') then
		--				
        --    elseif WarMenu.MenuButton('Escoje a tu carro', 'menu_monturas_carros_base') then
        --                 
        --    elseif WarMenu.MenuButton('Escoje tus complementos de carro', 'menu_monturas_carros_complementos') then
        --                 
		--	end
		--	WarMenu.Display()           
        end
        Citizen.Wait(0)
    end
end)



Citizen.CreateThread( function()
	WarMenu.CreateSubMenu('menu_monturas_caballos_opciones','menu_monturas_caballos', Config.Language["SubTitleOptionsText"])
	repeat
		if WarMenu.IsMenuOpened('menu_monturas_caballos_opciones') then
			if WarMenu.Button(Config.Language["optionSendHorseToStable"],'',Config.Language["optionSendHorseToStableDesc"]) then
				print("guardar")
				fleeHorse()
			elseif WarMenu.Button(Config.Language["optionTameHorse"],'',Config.Language["optionTameHorseDesc"]) then
				print("registrar")
				local isMounted = IsPedOnMount(PlayerPedId())
				local isOwned = IsEntityAMissionEntity(GetMount(PlayerPedId()))
				if isMounted then
					if not isOwned then
						newVeh('horse')
					else
						TriggerEvent("redemrp_notification:start", Config.Language["notifHasOwner"] , 3, "error")
					end
				else
					TriggerEvent("redemrp_notification:start", Config.Language["notifNeedBeMount"] , 3, "warning")
				end

			elseif WarMenu.Button(Config.Language["optionDeleteHorse"],'',Config.Language["optionDeleteHorseDesc"]) then
				liberar()
			end
			WarMenu.Display()
		end
		Citizen.Wait(1)
	until false
end)

Citizen.CreateThread( function()
	WarMenu.CreateSubMenu('menu_monturas_caballos_base','menu_monturas_caballos', Config.Language["SubTitleOptionsText"])
	repeat
		if WarMenu.IsMenuOpened('menu_monturas_caballos_base') then

			for k,item in pairs(MisCaballos) do
				print(k)
				print(item.name)
				if WarMenu.Button(item.name,'',Config.Language["callHorseName"] .. item.name) then
					fleeHorse()
					defHorse(item.name)
					Wait(1000)
					checkHorse()
				end
			end
			WarMenu.Display()
		end
		Citizen.Wait(1)
	until false
end)

RegisterNetEvent('rlc_caballos:actualizarCaballos')
AddEventHandler('rlc_caballos:actualizarCaballos', function(id,nombre,tipo)
	MisCaballos[id] = {
		['name'] = nombre,
		['type'] = tipo
	}
	
end)

RegisterNetEvent('rlc_caballos:actualizarComplementos')
AddEventHandler('rlc_caballos:actualizarComplementos', function(id, nombre, tipo, hash)
	MisComplementos[id] = {
		['nombre_complemento'] = nombre,
		['tipo'] = tipo,
		['hash'] = hash
	}
	
end)

RegisterNetEvent('rlc_caballos:forzarActualizar')
AddEventHandler('rlc_caballos:forzarActualizar', function()
	MisCaballos={}
	Wait(1000)
	TriggerServerEvent('rlc_caballos:escogerCaballo')
	
end)


RegisterNetEvent('rlc_caballos:forzarActualizar2')
AddEventHandler('rlc_caballos:forzarActualizar2', function()
	MisComplementos = {}
	Wait(1000)
	TriggerServerEvent('rlc_caballos:escogerComplementos')
	
end)


Citizen.CreateThread( function()
	WarMenu.CreateSubMenu('menu_monturas_caballos_complementos','menu_monturas_caballos', Config.Language["SubTitleOptionsText"])
	repeat
		if WarMenu.IsMenuOpened('menu_monturas_caballos_complementos') then
			for k,item in pairs(MisComplementos) do
				if WarMenu.Button(item.nombre_complemento,'',Config.Language["putAccessoriesOnHorse"] .. item.nombre_complemento) then
					print(tonumber(item.tipo))
					GuardarComplemento(tonumber(item.tipo), item.hash)
				end
			end
			WarMenu.Display()
		end
		Citizen.Wait(1)
	until false
end)

function GuardarComplemento(tipo, hash)

	if tipo == 1 then
		TriggerServerEvent("rlc_caballos:colocarComplementos", hash, "saddle", myHorse[2]);
		Citizen.InvokeNative(0xD3A7B003ED343FD9, myHorse[4],tonumber(hash),true,true,true) --saddle
	elseif tipo == 2 then
		TriggerServerEvent("rlc_caballos:colocarComplementos", hash, "blanket", myHorse[2]);
		Citizen.InvokeNative(0xD3A7B003ED343FD9,  myHorse[4],tonumber(hash),true,true,true) --blanket
	elseif tipo == 3 then
		TriggerServerEvent("rlc_caballos:colocarComplementos", hash, "mane", myHorse[2]);
		Citizen.InvokeNative(0xD3A7B003ED343FD9,  myHorse[4],tonumber(hash),true,true,true) --mane
	elseif tipo == 4 then
		TriggerServerEvent("rlc_caballos:colocarComplementos", hash, "tail", myHorse[2]);
		Citizen.InvokeNative(0xD3A7B003ED343FD9,  myHorse[4],tonumber(hash),true,true,true) --tail
	elseif tipo == 5 then
		TriggerServerEvent("rlc_caballos:colocarComplementos", hash, "bag", myHorse[2]);
		Citizen.InvokeNative(0xD3A7B003ED343FD9,  myHorse[4],tonumber(hash),true,true,true) --bag
	elseif tipo == 6 then
		TriggerServerEvent("rlc_caballos:colocarComplementos", hash, "bedroll", myHorse[2]);
		Citizen.InvokeNative(0xD3A7B003ED343FD9,  myHorse[4],tonumber(hash),true,true,true) --bedroll
	elseif tipo == 7 then
		TriggerServerEvent("rlc_caballos:colocarComplementos", hash, "stirups", myHorse[2]);
		Citizen.InvokeNative(0xD3A7B003ED343FD9,  myHorse[4],tonumber(hash),true,true,true) --stirups
	end

end

RegisterNetEvent('z00thorses:spawnHorse')
AddEventHandler('z00thorses:spawnHorse', function(horseData, horseName, id, saddle, blanket, mane, tail, bag, bedroll, stirups)
  myHorse[1] = tonumber(horseData)
  myHorse[2] = id
  myHorse[3] = horseName
  print("Model: ", myHorse[1], " DB ID: ", myHorse[2], tonumber(saddle))
  if myHorse[1] ~= 0 then
	local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(playerPed, 0.0, -40.0, 0.0))
	local gChk, groundZ = nil, nil
	
	for height = 1, 1000 do
		gChk, groundZ = GetGroundZAndNormalFor_3dCoord(x, y, height+0.0)
			if gChk then
				print('FOUND GROUND!: ' .. groundZ)
				break
			end
    end

	RequestModel(myHorse[1])
    
	Citizen.CreateThread(function()
        local waiting = 0
        while not HasModelLoaded(myHorse[1]) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 5000 then
                print("Could not load ped")
                break
            end
        end
            myHorse[4] = CreatePed(myHorse[1], x, y, groundZ+2, GetEntityHeading(playerPed), 1, 0)
			Citizen.InvokeNative(0x6A071245EB0D1882, myHorse[4], playerPed, -1, 7.2, 2.0, 0, 0)
			Citizen.InvokeNative(0x283978A15512B2FE, myHorse[4], true)
			Citizen.InvokeNative(0x23f74c2fda6e7c61, -1230993421, myHorse[4])
			SetPedNameDebug(myHorse[4], myHorse[3])
			SetPedPromptName(myHorse[4], myHorse[3])

			Citizen.InvokeNative(0xD3A7B003ED343FD9, myHorse[4],tonumber(saddle),true,true,true) --saddle
			Citizen.InvokeNative(0xD3A7B003ED343FD9, myHorse[4],tonumber(blanket),true,true,true) --blanket
			Citizen.InvokeNative(0xD3A7B003ED343FD9, myHorse[4],tonumber(mane),true,true,true) --mane
			Citizen.InvokeNative(0xD3A7B003ED343FD9, myHorse[4],tonumber(tail),true,true,true) --tail
			Citizen.InvokeNative(0xD3A7B003ED343FD9, myHorse[4],tonumber(bag),true,true,true) --bag
			Citizen.InvokeNative(0xD3A7B003ED343FD9, myHorse[4],tonumber(bedroll),true,true,true) --bedroll
			Citizen.InvokeNative(0xD3A7B003ED343FD9, myHorse[4],tonumber(stirups),true,true,true) --stirups
			
			SetModelAsNoLongerNeeded(myHorse[4])
			Wait(1000)
    end)
  end
end)

function checkHorse(source, args, rawCommand)
	local isMounted = IsPedOnMount(playerPed)
	playerPed = PlayerPedId() --Updating when needed?
	if myHorse[4] ~= 0 then
		if not isMounted then
			Wait(2000)
			Citizen.InvokeNative(0x6A071245EB0D1882, myHorse[4], playerPed, -1, 7.2, 2.0, 0, 0)
		end
	else
		TriggerServerEvent("z00thorses:getHorse")
	end
end

function fleeHorse(source, args, rawCommand)

	if myHorse[4] ~= 0 then
		DeletePed(myHorse[4])
		TriggerServerEvent("z00thorses:stableHorse", myHorse[2])
		myHorse[4] = 0
	end
    
end

function newVeh(vehType, id)
	print(vehType, id)
	local currentHorse = GetEntityModel(GetMount(playerPed))
	local inPut1 = ""
	local inPut2 = ""
	Citizen.CreateThread(function()
		AddTextEntry("FMMC_MPM_TYP8", "Elige un nombre para tu nuevo caballo:")
		DisplayOnscreenKeyboard(1, "FMMC_MPM_TYP8", "", "Nombre", "", "", "", 30)
		while (UpdateOnscreenKeyboard() == 0) do
			DisableAllControlActions(0);
			Citizen.Wait(0);
		end
		if (GetOnscreenKeyboardResult()) then
			inPut1 = GetOnscreenKeyboardResult()
			TriggerServerEvent('z00thorses:newVehicle', currentHorse, vehType, inPut1, id)
		end
	
	end)
end

function liberar()
	if myHorse[4] ~= 0 then
		TriggerServerEvent("rlc_caballos:liberarCaballo", myHorse[2])
		fleeHorse()
	end
end


RegisterNetEvent('z00thorses:delMount')
AddEventHandler('z00thorses:delMount', function()
	
	local currentHorse = IsEntityAMissionEntity(GetMount(playerPed))
	print(currentHorse)
	if not currentHorse then
		local horsePed = GetEntityModel(GetMount(playerPed))
		DeletePed(horsePed)
	end

end)
	

function delHorse(source, args, rawCommand)

	if myHorse[4] ~= 0 then
		DeletePed(myHorse[4])
		TriggerServerEvent("z00thorses:stableHorse", myHorse[2])
		myHorse[4] = 0
	end
    
end

function defHorse(name)

	TriggerServerEvent("z00thorses:defVeh", name)
	
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if Citizen.InvokeNative(0x91AEF906BCA88877, 0, 0x24978A28) then -- Control =  H
			checkHorse()
			Citizen.Wait(10000) --Flood Protection? i think yes zoot
        end
		
		if Citizen.InvokeNative(0x91AEF906BCA88877, 0, 0x4216AF06) then -- Control = Horse Flee
			local horseCheck = Citizen.InvokeNative(0x7912F7FC4F6264B6, playerPed, myHorse[4])
			if horseCheck then
				fleeHorse()
			end
		end			
		
    end
end)

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
	Citizen.InvokeNative(0xADA9255D, 1);
    DisplayText(str, x, y)
end