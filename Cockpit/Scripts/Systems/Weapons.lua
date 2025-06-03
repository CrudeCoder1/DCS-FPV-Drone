dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.common_script_path.."devices_defs.lua")
dofile(LockOn_Options.common_script_path.."../../../Database/wsTypes.lua")

local Dev = GetSelf()
local update_rate = 1
make_default_activity(update_rate)



function post_initialize()
    local birth = LockOn_Options.init_conditions.birth_place	--"GROUND_COLD","GROUND_HOT","AIR_HOT"
    if birth=="GROUND_HOT" or birth=="AIR_HOT" then 	  	
    elseif birth=="GROUND_COLD" then
    end
end


function update() 
	
end


Dev:listen_command(Keys.DetonateWeapon)

function SetCommand(command,value)
	if command == Keys.DetonateWeapon then
		Dev:launch_station(0)
		set_aircraft_draw_argument_value(308,1)-- hide bomb
		--print_message_to_user("Detonate")
	end
end

need_to_be_closed = false -- close lua state after initialization
--[[
available functions:
["get_station_info"] 
["set_ECM_status"] 
["get_ECM_status"]  
["launch_station"] 
["select_station"] 
["emergency_jettison"]  
["emergency_jettison_rack"] 
["set_target_range"]  
["set_target_span"]  
["get_target_range"]  
["get_target_span"]  
["get_flare_count"]  
["drop_flare"] 
["get_chaff_count"] 
["drop_chaff"] 

["listen_event"]  
["performClickableAction"] 
["SetDamage"] 
["listen_command"] 
["SetCommand"] 
--]]
