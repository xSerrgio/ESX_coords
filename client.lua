ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('GetCoords')
AddEventHandler('GetCoords', function()

  local msg = 'ff /n ff'
  print(msg)
end)

RegisterCommand('co', function(source, args)
  local title = table.concat(args, " ")
  local coords = GetEntityCoords(PlayerPedId())
  local vector = 'vector3(' .. coords.x .. ', ' .. coords.y .. ', ' .. coords.z .. ')' 
  local vectorf = 'vector4(' .. coords.x .. ', ' .. coords.y .. ', ' .. coords.z .. ', ' .. GetEntityHeading(PlayerPedId()) .. ')'
  local table = '{' .. coords.x .. ', ' .. coords.y .. ', ' .. coords.z .. ', ' .. GetEntityHeading(PlayerPedId()) .. '}'
  local xyz = '{ x = ' .. coords.x .. ', y = ' .. coords.y .. ', z = ' .. coords.z .. '}'
  local xyzh = '{ x = ' .. coords.x .. ', y = ' .. coords.y .. ', z = ' .. coords.z .. ', h = ' .. GetEntityHeading(PlayerPedId()) .. '}'

  if title == nil or title == '' then
    title = 'Coordenadas enviadas por ' .. GetPlayerName(PlayerId())
  else
    title = title .. ' | Coordenadas por ' .. GetPlayerName(PlayerId())
  end

  local connect = {
    {
        ["color"] = "12745742",
        ["title"] = title,
        ["description"] = "**[Vector 3]: **\n"..vector .. '\n**[Vector 4]:**\n' .. vectorf .. '**\n[Table]:**\n' .. table .. '**\n[XYZ Table]:**\n' .. xyz.. '**\n[XYZH Table]:**\n' .. xyzh,
        ["footer"] = {
            ["text"] = 'Coords Log',
            ["icon_url"] = '',
        },
    }
  }

    TriggerServerEvent('CoordsPrint', connect)

end)

function round(num, numDecimalPlaces)
	local mult = 5^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end