local Webhook = 'https://discordapp.com/api/webhooks/741682060745506929/AwypIKxiGkUayIKpuk1TbILBSkzSDs1QlgAVehAAcgOjpw224DLlROuFvmZ0Zw73mxU0'

local SystemName = 'Coords Bot'


RegisterServerEvent('CoordsPrint')
AddEventHandler('CoordsPrint', function(embed)
    ToDiscord(embed)
end)

function ToDiscord(embed)
	PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({username = SystemName, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

function stringsplit(input, seperator)
	if seperator == nil then
		seperator = '%s'
	end
	
	local t={} ; i=1
	
	for str in string.gmatch(input, '([^'..seperator..']+)') do
		t[i] = str
		i = i + 1
	end
	
	return t
end
