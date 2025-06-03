dofile("Scripts/Database/Weapons/warheads.lua")

declare_weapon({
	category 				= CAT_SHELLS,
	name 					= "DroneBombShell",
	user_name 				= _("Drone Bomb"),
	model_name    			= "tracer_bullet_red",
	v0    					= 10.0,
	Dv0   					= 0.0,
	Da0     				= 0.0,
	Da1     				= 0.0,
	mass      				= 1.0,
	explosive     			= 1.0,
	piercing_mass			= 1.0,
	life_time     			= 0.001,
	caliber     			= 10.0,
	s         				= 0.0,
	j         				= 0.0,
	l         				= 0.0,
	charTime    			= 0,
	cx        				= {0.5,1.27,0.7,0.2,2.3},
	k1        				= 1.0e-09,
	tracer_off    			= -1,
	scale_smoke    			= 0.0, 
	smoke_opacity  			= 0.0,	
	cartridge = 0,	
	--visual_effect_correction = 4.0,	
});


function FakeGunMount(tbl)
    tbl.category = CAT_GUN_MOUNT
    tbl.name      = "DroneBombMount"
    tbl.supply      =
    {
        shells = {"DroneBombShell"},
        mixes  = {{1}},
        count  = 1,	
    }
    tbl.gun =
    {
        max_burst_length    = 1, -- minimum number of rounds fired per burst
        rates               = {100},
        recoil_coeff        = 0.0001,
        barrels_count       = 1,
    }
    tbl.ejector_pos             = {0.0,0.0,0.0} -- position from muzzle connector pos
    tbl.ejector_dir             = {0, 0, 0} -- left/right; back/front;?/?
    tbl.supply_position         = {-0.19845, 0.091785, 0.0}
    tbl.aft_gun_mount           = false
    tbl.effective_fire_distance = 1000
    tbl.drop_cartridge          = 0	--drop shell shape/size from  aircraft_gun_mounts.lua
    tbl.muzzle_pos              = {0.0,0.0,0}     -- all position from connector
    --tbl.muzzle_pos_connector    = tbl.muzzle_pos_connector  or  "Gun_point" -- all position from connector
    tbl.azimuth_initial         = 0
    tbl.elevation_initial       = 0

    return declare_weapon(tbl)
end

FPVDroneBomb = {
    category        = CAT_PODS,
    CLSID           = "{DroneBomb}",
    attribute       = {wsType_Weapon,wsType_GContainer,wsType_Cannon_Cont,WSTYPE_PLACEHOLDER},
    wsTypeOfWeapon  = {wsType_Weapon,wsType_Shell,wsType_Shell,WSTYPE_PLACEHOLDER},
    Picture         = "ptb.png",
    displayName     = _("Improvised Explosive"),
    Weight          = 0.0001,
    Cx_pil          = 0.00001,
    Elements        = {{ShapeName = "cockpit_FPV"}},
    kind_of_shipping = 2,   -- SOLID_MUNITION
    gun_mounts      = {
        FakeGunMount({		
			})
    },
    shape_table_data = {{file = 'cockpit_FPV'; username = 'Improvised Explosive'; index = WSTYPE_PLACEHOLDER;}}
}
declare_loadout(FPVDroneBomb)
