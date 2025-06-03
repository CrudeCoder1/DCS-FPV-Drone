local cockpit = folder.."../../Cockpit/Scripts/"
dofile(cockpit.."devices.lua")
dofile(cockpit.."command_defs.lua")
local res = external_profile("Config/Input/Aircrafts/common_keyboard_binding.lua")

-- down = single instance,  pressed = continuous input
join(res.keyCommands,{

	{combos = {{key = 'A'}}, down = Keys.ArmToggle, 	name = _('Toggle Drone Arm'), category = _('Flight Control')},

    {combos = {{key = '1'}}, down = Keys.AcroMode, 		name = _('Flight Mode - Acro'), category = _('Flight Control')},
	{combos = {{key = '2'}}, down = Keys.AngleMode, 	name = _('Flight Mode - Angle'), category = _('Flight Control')},
	--{combos = {{key = '3'}}, down = Keys.HorizonMode, 	name = _('Flight Mode - Horizon'), category = _('Flight Control')},
	
	{combos = {{key = 'Space'}}, down = Keys.DetonateWeapon, 	name = _('Detonate Weapon'), category = _('Weapons')},

})
return res



