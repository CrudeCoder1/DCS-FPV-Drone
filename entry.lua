local self_ID = "FPV_Drone"
declare_plugin(self_ID,
{
dirName			= current_mod_path,
displayName		= _("FPV_Drone"),
fileMenuName	= _("FPV_Drone"),
state			= "installed",
--developerName	= _(" "),
info			= _("FPV_Drone Description."),
--encyclopedia_path = current_mod_path..'/Encyclopedia',

binaries =
{ 
'FPV_Drone',
},
Skins =
{
	{
		name	= "FPV_Drone",
		dir		= "Skins/1"
	},
},
Missions =
{
	{
		name	= _("FPV_Drone"),
		dir		= "Missions",
	},
},
LogBook =
{
	{
		name	= _("FPV_Drone"),
		type	= "FPV_Drone",
	},
},
InputProfiles = 
{
	["FPV_Drone"] = current_mod_path .. '/Input',	
},
Options =
{
    {
        name		= _("FPV_Drone"),
        nameId		= "FPV_Drone",
        dir			= "Options",
        CLSID		= "{FPV_Drone options}"
    },
},
})
-------------------------------------------------------------------------------
mount_vfs_model_path(current_mod_path.."/Shapes")
mount_vfs_liveries_path (current_mod_path.."/Liveries")
mount_vfs_texture_path(current_mod_path.."/Textures")
mount_vfs_texture_path(current_mod_path.."/Textures/Avionics")--for textures used in cockpit systems i.e. digital fonts
mount_vfs_texture_path(current_mod_path.."/Skins/1/ME")

dofile(current_mod_path..'/FPV_Drone.lua')
dofile(current_mod_path..'/Weapons/FPV_Quad_Weapons.lua')
dofile(current_mod_path.."/Views.lua")
make_view_settings('FPV_Drone', ViewSettings, SnapViews)


local cfg_path = current_mod_path ..  "/FM/config.lua"
dofile(cfg_path)
FM[1] 				= self_ID
FM[2] 				= 'FPV_Drone'
FM.config_path 		= cfg_path

make_flyable('FPV_Drone',current_mod_path..'/Cockpit/Scripts/', FM, current_mod_path..'/comm.lua')

plugin_done()