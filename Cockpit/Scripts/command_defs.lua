local function counter()
	count = count + 1
	return count
end

count = 10000

Keys =
{
	ArmToggle	 	 = counter(),
	AcroMode	 	 = counter(),
	AngleMode	 	 = counter(),
	HorizonMode	 	 = counter(),
	
	DetonateWeapon	 = counter(),
	
	showControlInd = counter(),
}

count = 3200
device_commands = { -- commands for lua

	AuxPowerSw  	= counter();
	
	FuelShutoffSw	= counter();
	FuelPumpSw 		= counter();
	
	MasterArm		= counter();
	SalvoSw			= counter();
	JettSw			= counter();
	JettSwCover		= counter();
	RocketSelector	= counter();
	GunSelector		= counter();
	
	PositionLights	= counter();
	CovertLight		= counter();
	AntiCollision	= counter();
	LandingLightSw	= counter();
	
	RWRpower		= counter();
	RWRBrightness	= counter();
	
	AltimeterSet	= counter();
	ADIadjust		= counter();
	LOset			= counter();
	HIset			= counter();
}

EFM_commands = 	-- commands for use in EFM (make sure to copy to inputs.h)
{
	starterButton 		= 3010,
	throttleIdleCutoff	= 3011,
	throttle			= 3012,
	batterySwitch 		= 3013,
	generatorSwitch 	= 3014,
	inverterSwitch 		= 3015,
	throttleAxis		= 3016,
	trimUp				= 3017,
	trimDown			= 3018,
	trimLeft			= 3019,
	trimRight			= 3020,
}


