dofile(LockOn_Options.script_path.."command_defs.lua")

-- This device is used to help initialize clickable switches and to interface keyboard bindings with clickables
-- performClickableAction doesn't seem to send the command to the EFM, so dispatch_action is used for that

local update_rate = 0.05
make_default_activity(update_rate)
local dev = GetSelf()

--local SHOW_CONTROLS  = get_param_handle("SHOW_CONTROLS")

local BatteryPercent  = get_param_handle("BatteryPercent")-- from EFM
local isArmed  = get_param_handle("isArmed")
local FlightMode  = get_param_handle("FlightMode")

local ScreenStatic  = get_param_handle("ScreenStatic")

-- special options
local option_maxYawRate = get_plugin_option_value("FPV_Drone","maxYawRate","local")
local Option_YawRate  = get_param_handle("Option_YawRate")

local option_maxPitchRollRate = get_plugin_option_value("FPV_Drone","maxPitchRollRate","local")
local Option_PitchRollRate  = get_param_handle("Option_PitchRollRate")

local option_maxAngle = get_plugin_option_value("FPV_Drone","maxAngle","local")
local Option_Angle  = get_param_handle("Option_Angle")

local option_gravityMult = get_plugin_option_value("FPV_Drone","gravity","local")
local Option_Gravity  = get_param_handle("Option_Gravity")

function post_initialize()
	--SHOW_CONTROLS:set(1)
    local birth = LockOn_Options.init_conditions.birth_place
    if birth=="AIR_HOT" then
		isArmed:set(1)   
    end
	ScreenStatic:set(0)
	
	Option_YawRate:set(option_maxYawRate)
	Option_PitchRollRate:set(option_maxPitchRollRate)
	Option_Angle:set(option_maxAngle)
	Option_Gravity:set(option_gravityMult)
	
	set_aircraft_draw_argument_value(38, 1)-- so "cockpit" noise matches external
	
	--show_param_handles_list()--see all param handles in-game
end



dev:listen_command(Keys.ArmToggle)
dev:listen_command(Keys.AcroMode)
dev:listen_command(Keys.AngleMode)
dev:listen_command(Keys.HorizonMode)

--dev:listen_command(Keys.showControlInd)

function SetCommand(command,value)
	
	if command == Keys.ArmToggle then
		isArmed:set(1-isArmed:get())

	elseif command==Keys.AcroMode then
		FlightMode:set(0)
	elseif command==Keys.AngleMode then
		FlightMode:set(1)
	elseif command==Keys.HorizonMode then	
		FlightMode:set(2)
	--elseif command == Keys.showControlInd then
	--	SHOW_CONTROLS:set(1-SHOW_CONTROLS:get())
	end
end


--dev:listen_event("GroundPowerOn")
--dev:listen_event("GroundPowerOff")
function CockpitEvent(event,val)
end

local counter = 0
function update()
	
	if BatteryPercent:get()<=1 and counter>0 then		
		ScreenStatic:set(counter)
	else
		ScreenStatic:set(0)
	end	
	
	counter = counter+1
	if counter>4 then
		counter=1
	end
--print_message_to_user("test")
end


need_to_be_closed = false -- close lua state after initialization