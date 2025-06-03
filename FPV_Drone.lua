local lbToKg = 0.453592
local ftToM = 0.3048
local knotToMpS = 0.514444
local knotToKMpH = 1.852
-- 447 mr vis
--	-- arg 407-410 for rotation of solid/normal prop
	-- arg 475-478 for visibility of normal prop
FPVDrone = {
	Name				=	'FPV_Drone', -- unique name internal to DCS
	Picture				=	'FPV_Drone.png',	-- Rearming loadout window picture
	DisplayName			=	_('FPV Drone'),-- actual name displayed in menus and in-game
	
	shape_table_data 	= {
		{
			file  	    = 'FPV_Drone';
			username    = 'FPV_Drone';
			desrt		= 'Fighter-2-crush';-- name of destroyed shape table, see below
			index       =  WSTYPE_PLACEHOLDER;
			life  	    = 1; --   The health of the object (ie. lifebar)
			vis   	    = 0.2; -- Visibility factor (For a small objects is better to put lower nr).
			fire  	    = { 300, 2}; -- Fire on the ground after destoyed: 300sec 4m
		},
		--{name="Drone_destr"; file="Drone_destr"; fire={ 240, 2};},
	},
	propellorShapeType  = "3ARG_PROC_BLUR",
    propellorShapeName  = "FPV_drone_Prop.FBX",

	mapclasskey 		= "P0091000023", -- found in MissionEditor/data/NewMap/images/nato/P91000023.png   gives map symbol 
	attribute  			= {wsType_Air, wsType_Helicopter, wsType_Battleplane, WSTYPE_PLACEHOLDER ,"Attack helicopters",},
	Categories 			= {},
	Rate 				= 1,  -- RewardPoint in Multiplayer
	--date_of_introduction =   2015.0,
	-------------- Aircraft Physical properties -----------
	length				= 1.06*ftToM, -- [meters]
	height				= 0.5*ftToM, -- [meters]
	rotor_RPM			= 30000, -- This is used in the EFM for rotor sound
	M_empty				= 1.00, -- [kg] empty weight 
	M_nominal			= 1.00, -- [kg]
	M_max				= 1.5, -- Max gross weight [kg]
	M_fuel_max			= 0.001, -- max fuel weight [kg]
	RCS					= 0.1, -- Radar Cross Section m^2
	IR_emission_coeff	= 0.01, -- 1 is IR emission of Su-27	
	--MOI 				= {12000, 35000, 40000},
	nose_gear_pos 		= { 0.308,	-0.22,	0}, -- used for starting placement on ground {forward/back,up/down,left/right}
	main_gear_pos 		= { -0.308,	-0.22,	0.308},
	lead_stock_main		= -0.01,--something to do with the gear
	lead_stock_support	= -0.01,--something to do with the gear	
	--sound_name 		= "Rotor", -- rotor sound from Sounds/sdef
	engines_count		= 4, -- number of engines
	engines_nozzles 	= 
	{
		{
		engine_number   = 1, -- this nozzle is for engine #1
		pos     	    = {0,0, 0}, -- important for heatblur effect
		diameter        = 0.0, -- [meters]
		smokiness_level = 0.0,
		}
	},
	
	------------- AI definitions (also affects Mission Editor i.e. max speed to set at waypoint) ------------------------------
	V_max				=	100*knotToKMpH, -- [km/h] max speed for AI
	V_max_cruise		=	100*knotToKMpH,	-- cruise speed [km/h]
	Vy_max				=	10.5, --Max climb speed in [m/s]
	H_stat_max_L		=	3000*ftToM,-- max height hover [m]
	H_stat_max			=	3000*ftToM,-- max height hover [m]
	H_din_two_eng		=	5000*ftToM,-- max height forward flight [m]
	H_din_one_eng		=	5000*ftToM,-- max height forward flight [m]
	range				=	40, -- max range [km], for AI
	flight_time_typical	=	10,-- minutes
	flight_time_maximum	=	25,-- minutes
	Vy_land_max			=	20*knotToMpS, -- landing speed [m/s]
	Ny_max				=	6.0, --max G for AI
	scheme				=	0,-- 0 for normal helis, 1 for ka-50 (might be rotor configuration)
	----- AI flight model probably (doesnt affect human FM)
	rotor_height		=	0.5*ftToM,-- height of rotor from ground [meters]
	rotor_diameter		=	1.0*ftToM,-- [meters]
	blade_chord			=	0.1,-- [meters]
	blades_number		=	3,
	blade_area			=	0.112, -- [m^2]
	fuselage_Cxa0		=	0.1,-- drag coefficient
	fuselage_Cxa90		=	0.1,-- side drag coefficient?
	fuselage_area		=	0.1, -- [m^2]
	centering			=	0,--???
	tail_pos 			= 	{-0.564, 0.0, 0},
	tail_fin_area		=	0.1,-- vertical fin area [m^2]
	tail_stab_area		=	0.1,-- horizontal tail area [m^2]
	thrust_correction	=	0.55,
	rotor_MOI			=	10,
	rotor_pos 			= 	{0,	0, 0},

	engine_data = 
	{  -- these are only for AI (except the sound_name)
		power_take_off = 1,-- [kW]
		power_max	   = 1,-- [kW]
		power_WEP	   = 1,-- [kW]
		power_TH_k     = { -- power change from altitude
			[1] = {0,	-230.8,	2245.6},
			[2] = {0,	-230.8,	2245.6},
			[3] = {0,	-325.4,	2628.9},
			[4] = {0,	-235.6,	1931.9},
		},
		SFC_k = {2.045e-007, -0.0006328, 0.803},-- Specific fuel consumption (probably polynomial coefs.)
		power_RPM_k = 	{-0.08639,	0.24277,	0.84175},-- power vs RPM (probably polynomial coefs.)
		power_RPM_min	=	9.1384,
		sound_name	= "QuadcopterMotor", -- engine sound from Sounds/sdef
	},
	
	Sensors = {	-- defines what the AI can use in terms of sensors
        OPTIC = {"TADS DVO"} -- AI can engage enemy at night
	},	
	CanopyGeometry = {
        azimuth   = {-100.0, 120.0}, -- pilot view horizontal (AI)
        elevation = {-50.0, 110.0} -- pilot view vertical (AI)
    },
	--CanopyGeometry = makeHelicopterCanopyGeometry(LOOK_AVERAGE, LOOK_AVERAGE, LOOK_AVERAGE),
		
	------------- Misc Properties ------------------------------
	crew_size = 1,
	crew_members = 
	{
		[1] =
		{	ejection_seat_name	=	0, -- name of object file used for pilot ejection
			drop_canopy_name	=	0, -- name of object file used for canopy jettison
			pos = 	{0.0, 0.0, 0.0}, -- used for ejection location	
			canopy_arg   = 38, -- important for noise effects of open/closed
			g_suit		= 50.0,
		}		
	},

	fires_pos =
	{ 
		--[1] = 	{-1.8,	-0.55,	0}, -- turbine exit
	},		

	stores_number =	1,
	Pylons = {
        pylon(1, 0, 0.0, 0.0, 0,	-- (Pylon #, ext wing=0(no ejection)/ext fuselage=1/internal bay=2, forward/back, up/down, left/right)
            {	use_full_connector_position = true, connector = "PYLON1",
				arg				= 308,
				arg_value		= 1,
			},         
			{
                {CLSID = "{DroneBomb}", arg_value = 0.0,Cx_gain = 0.5},
            }
        ),       
    },
		
	Tasks = { 	-- Mission Editor Tasks. Defined in db_units_planes.lua	
        aircraft_task(GroundAttack),
        aircraft_task(AFAC),
        aircraft_task(Reconnaissance),
    },	
	DefaultTask = aircraft_task(Reconnaissance),
	--[[
	LandRWCategories = 	-- adds these takeoff and landing options avaliable in mission editor
    {	[1] = 
        {
           Name = "HelicopterCarrier",
        },
        [2] = 
        {
           Name = "AircraftCarrier",
        },
    },
	TakeOffRWCategories = 
    {	[1] = 
        {
            Name = "HelicopterCarrier",
        },
        [2] = 
        {
           Name = "AircraftCarrier",
        },
    },--]]
	
	Damage = verbose_to_dmg_properties( --index meaning see in Scripts\Aircrafts\_Common\Damage.lua
	{		-- deps_cells defines what other parts get destroyed along with it			
		["MAIN"]  		= {critical_damage = 2, args = {151}, deps_cells = {"COCKPIT","WING_L_01","WING_L_02","WING_L_03","WING_L_04"}}, 
		["WING_L_01"]  	= {critical_damage = 1, args = {152}},-- Aft R Arm
		["WING_L_02"]  	= {critical_damage = 1, args = {153}},-- Front R Arm
		["WING_L_03"]  	= {critical_damage = 1, args = {154}},-- Aft L Arm
		["WING_L_04"]  	= {critical_damage = 1, args = {155}},-- Front L Arm
		
		["Line_WING_L"]		= {critical_damage = 7, args = {156}}, -- aft Left line
		["Line_WING_R"]		= {critical_damage = 7, args = {157}}, -- aft Right line
		["Line_STABIL_L"]	= {critical_damage = 7, args = {158}}, -- front line L	
		["Line_STABIL_R"]	= {critical_damage = 7, args = {159}}, -- front line R
					
		--["CREW_1"]			= {critical_damage = 1, args = {205}}, -- pilot
		["COCKPIT"]			= {critical_damage = 4, args = {149}},-- damage of COCKPIT will cause pilot death 
	}),
	
	Failures = { -- not working yet
		--{ id = 'engfail',	label = _('ENGINE'),	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		--{ id = 'rotor',		label = _('ROTOR'),		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
	},

	-- to drop custom parts,  use 1000+damage cell#   ex: to drop elevator use [1000+51]="_elevator"
	DamageParts = {	-- parts that fall off when aircraft is hit or crashes		
	},
	
	lights_data = {
	},
		
	net_animation = {   --transmits draw arguments over multiplyer for others to see
		308, --weapon draw
	},


	HumanRadio = {
		frequency = 124.0,
		editable = true,
		minFrequency = 118,
		maxFrequency = 143.975,
		modulation = MODULATION_AM
	},

	panelRadio = {		
		[1] = {
			name = _("FM Radio"),		   
			range = {{min = 30, max = 87.975}},
			channels = {
						[1] = { name = _("Channel 1"),		default = 30.0, modulation = _("FM")}, --, connect = true}, -- default
			}
		},
	},	
	
	-- Aircraft Additional Properties in mission editor
	AddPropAircraft = {		
	},
}

add_aircraft(FPVDrone)
