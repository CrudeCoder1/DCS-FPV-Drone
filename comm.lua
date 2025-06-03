local openFormation = true

function specialEvent(params) 
	return staticParamsEvent(Message.wMsgLeaderSpecialCommand, params)
end

local menus = data.menus

data.rootItem = {
	name = _('Main'),
	getSubmenu = function(self)	
		local tbl = {
			name = _('Main'),
			items = {}
		}
		
		if data.pUnit == nil or data.pUnit:isExist() == false then
			return tbl
		end
		
		if self.builders ~= nil then
			for index, builder in pairs(self.builders) do
				builder(self, tbl)
			end
		end
		
		if #data.menuOther.submenu.items > 0 then
			tbl.items[10] = {
				name = _('Other'),
				submenu = data.menuOther.submenu
			}
		end
		
		return tbl
	end,
	builders = {}
}

utils.verifyChunk(utils.loadfileIn('Scripts/UI/RadioCommandDialogPanel/Config/Common/Ground Crew.lua', getfenv()))(8)

