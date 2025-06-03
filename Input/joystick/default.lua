local cockpit = folder.."../../Cockpit/Scripts/"
dofile(cockpit.."devices.lua")
dofile(cockpit.."command_defs.lua")
local res = external_profile("Config/Input/Aircrafts/common_joystick_binding.lua")

-- down = single instance,  pressed = continuous input
join(res.keyCommands,{
    
	{combos = {{key = 'A'}}, down = Keys.ArmToggle, 	name = _('Toggle Drone Arm'), category = _('Flight Control')},

    {combos = {{key = '1'}}, down = Keys.AcroMode, 		name = _('Flight Mode - Acro'), category = _('Flight Control')},
	{combos = {{key = '2'}}, down = Keys.AngleMode, 	name = _('Flight Mode - Angle'), category = _('Flight Control')},
	--{combos = {{key = '3'}}, down = Keys.HorizonMode, 	name = _('Flight Mode - Horizon'), category = _('Flight Control')},

	{combos = {{key = 'Space'}}, down = Keys.DetonateWeapon, 	name = _('Detonate Weapon'), category = _('Weapons')},
	
})

join(res.axisCommands,{
{combos = defaultDeviceAssignmentFor("roll")	, action = iCommandPlaneRoll,			name = _('Roll')},
{combos = defaultDeviceAssignmentFor("pitch")	, action = iCommandPlanePitch,			name = _('Pitch')},
{combos = defaultDeviceAssignmentFor("rudder")	, action = iCommandPlaneRudder, 		name = _('Yaw')},
{combos = defaultDeviceAssignmentFor("thrust")	, action = iCommandPlaneThrustCommon,	name = _('Throttle')},

})
return res
