dofile(LockOn_Options.script_path.."devices.lua")
dofile(LockOn_Options.common_script_path.."tools.lua")
	
MainPanel = {"ccMainPanel",LockOn_Options.script_path.."mainpanel_init.lua"}
	
creators = {}
creators[devices.WEAPON_SYSTEM]		= {"avSimpleWeaponSystem"	,LockOn_Options.script_path.."Systems/Weapons.lua"}
creators[devices.EFM_HELPER]    	= {"avLuaDevice"            ,LockOn_Options.script_path.."Systems/EFM_Helper.lua"} 
--creators[devices.NVGs] 				= {"avNightVisionGoggles"}

indicators = {}
indicators[#indicators + 1] = {"ccIndicator" ,LockOn_Options.script_path.."OSD/Indicator/init.lua",nil}

