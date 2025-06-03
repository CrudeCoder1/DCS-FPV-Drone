--**This file is an attempt to document every available function in lua in DCS, but is incomplete at the moment**

local dev = GetSelf() --With this utility function the following can be used: performClickableAction, listen_command, listen_event, and for some special devices like avSimpleElectricSystem and avSimpleWeaponSystem there are a few more available

dev:listen_command()
function SetCommand(command,value) -- function called by DCS when a command is triggered
end


dev:listen_event("GroundPowerOn")
dev:listen_event("GroundPowerOff")
dev:listen_event("GroundAirOff")
dev:listen_event("GroundAirOn")
dev:listen_event("GroundAirApplyOn")
dev:listen_event("WeaponRearmFirstStep")
dev:listen_event("WeaponRearmComplete")
dev:listen_event("WeaponRearmSingleStepComplete")
dev:listen_event("UnlimitedWeaponStationRestore")
dev:listen_event("WheelChocksOn")
dev:listen_event("WheelChocksOff")
dev:listen_event("repair")
function CockpitEvent(event,val) -- function called by DCS when event happens
end

dev:performClickableAction(command, value, true/false)-- 3rd input set true to not trigger SetCommand. This function is used to ‘click’ a switch without using your mouse. This is used a lot for when a key is pressed and you want that key to move a switch.

post_initialize() --This function is run once at the beginning of mission start

update() --This function is run multiple times a second, depending on the update rate set. At the beginning of your device script you must define the update rate using make_default_activity()

print_message_to_user(output)--prints on screen in game, very useful for debug

show_param_handles_list()--see all param handles in-game

get_absolute_model_time() -- gives time of day of mission

get_mission_route()

get_aircraft_mission_data("Radio")[2].channels -- radio channels

set_aircraft_draw_argument_value(arg #, value)
get_aircraft_draw_argument_value(arg)
get_cockpit_draw_argument_value(arg)

dispatch_action(device ID, command, value)--Triggers command with value. Similar to device:performClickableAction()

get_param_handle(name)--This is used to set a param handle, best described as a global variable. It is useful for setting animations in mainpanel.lua, getting information into indicators, and getting information between an EFM and lua if you have an EFM. You use :set(value) and :get() to set and read it. Usage would look like:
throttle_position = get_param_handle("THROTTLE_POSITION")
throttle_position:set(0.5)
throttle_position:get()

get_player_crew_index()-- returns current crew position (0,1,..)

local pluginData =  get_plugin_option_value("AIRCRAFT_NAME","OPTION_NAME","local")

------------------------------------------------------------------------------------
local sensor_data = get_base_data() -- sensor data, full list below
getAngleOfAttack()
getAngleOfSlide()
getBarometricAltitude()
getCanopyPos()
getCanopyState()
getEngineLeftFuelConsumption()
getEngineLeftRPM()
getEngineLeftTemperatureBeforeTurbine()
getEngineRightFuelConsumption()
getEngineRightRPM()
getEngineRightTemperatureBeforeTurbine()
getFlapsPos()
getFlapsRetracted()
getHeading()
getHorizontalAcceleration()
getIndicatedAirSpeed()
getLandingGearHandlePos()
getLateralAcceleration()
getLeftMainLandingGearDown()
getLeftMainLandingGearUp()
getMachNumber()
getMagneticHeading()
getNoseLandingGearDown()
getNoseLandingGearUp()
getPitch()
getRadarAltitude()
getRateOfPitch()
getRateOfRoll()
getRateOfYaw()
getRightMainLandingGearDown()
getRightMainLandingGearUp()
getRoll()
getRudderPosition()
getSpeedBrakePos()
getSelfAirspeed()
getSelfCoordinates()
getSelfVelocity()
getStickPitchPosition()
getStickRollPosition()
getThrottleLeftPosition()
getThrottleRightPosition()
getTotalFuelWeight()
getTrueAirSpeed()
getVerticalAcceleration()
getVerticalVelocity()
getWOW_LeftMainLandingGear()
getWOW_NoseLandingGear()
getWOW_RightMainLandingGear()
------------------------------------------------------------------------------------
-- Sounds
sndhost = create_sound_host("anyName","HEADPHONES",0,0,0)
sndhost = create_sound_host("anyName","3D",0,0,0)
sndhost = create_sound_host("anyName","2D",0,0,0)
variable_name = sndhost:create_sound("Aircrafts/.../sound SDEF")
variable_name:play_continue()
variable_name:stop()
variable_name:play_once()
variable_name:update(nil, volume, 0.0)

local Terrain           = require('terrain')
--everything below requires Terrain
X: +North
Z: +East
Y: +Altitude
--X , Z , Alt Coords are in Meters!

Terrain.GetHeight(x, z)
--gives you the hight of the terrain at x,z  in meters

Terrain.isVisible(x1, alt1, z1, x2, alt2, z2)
-- check Terrain Line of sight (ignores buildings/trees)

Terrain.GetSurfaceType(x,z)
-- gives you the type of terrain.
--  LAND             1
--  SHALLOW_WATER    2
--  WATER            3 
--  ROAD             4
--  RUNWAY           5
-- during my last test there was not landtype for Woods

local tmp_lat,tmp_long = Terrain.convertMetersToLatLon(x,z)
-- turns the Meters Coords system to LatLong (be aware , it returns 2 vars)

local x, z = Terrain.convertLatLonToMeters(lat,long)
--gets you the METERS coord system from Lat Long
------------------------------------------------------------------------------------

local weather = require("Weather")
local x, y, z = sensor_data.getSelfCoordinates()
local dens = weather.getCloudsDensity({rectangle = {x1=x-1000, x2=x+1000, z1=z-1000, z2=z+1000, step=100}})

-- dens will be
dens = {
  {x, z, density},
  {x, z, density},
  ...
}

local   temp,pressure =  weather.getTemperatureAndPressureAtPoint({position = sensor_data:getSelfCoordinates()})
------------------------------------------------------------------------------------
{"change_color_when_parameter_equal_to_number", param_nr, number, red, green, blue}
{"text_using_parameter", param_nr, format_nr}
{"move_left_right_using_parameter", param_nr, gain}
{"move_up_down_using_parameter", param_nr, gain}
{"opacity_using_parameter", param_nr}
{"rotate_using_parameter", param_nr, gain}
{"compare_parameters", param1_nr, param2_nr} -- if param1 == param2 then visible
{"parameter_in_range", param_nr, greaterthanvalue, lessthanvalue} -- if greaterthanvalue < param < lessthanvalue then visible
{"parameter_compare_with_number", param_nr, number} -- if param == number then visible
{"draw_argument_in_range", arg_nr, greaterthanvalue, lessthanvalue} -- if greaterthanvalue < arg < lessthanvalue then visible
{"line_object_set_point_using_parameters", point_nr, param_x, param_y, gain_x, gain_y} -- applies to ceSimpleLineObject at least

{"change_texture_state_using_parameter",???} -- exists but crashed DCS when used with one argument.
{"change_color_using_parameter", ???} -- exists but crashed DCS when used with one to five arguments.
{"fov_control", ???}
{"increase_render_target_counter", ???}