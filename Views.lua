ViewSettings = {
	Cockpit = {
	[1] = {-- player slot 1 (pilot)
		CameraViewAngleLimits  = {109.9,110},-- FOV Min Max (how much zoom in/out)
		CockpitLocalPoint      = {0.166,0.0,0.0},	--where to line up center of cockpit model  {forward/back,up/down,left/right}
		--CameraAngleRestriction = {false,10,0.10}, 
		CameraAngleLimits      = {1,-1,35}, -- View right/left, View down/up
		EyePoint               = {0.0,0.0,0.0}, -- Distance from pivot point
		ShoulderSize		   = 0.0,
		Allow360rotation	   = false,
		limits_6DOF            = {x = {0,0},y ={0,0},z = {0,0},roll = 0.0},-- movement back/front bottom/top right/left
	},
	}, 
	Chase = { -- F4 view
		LocalPoint      = {-1.0, 0.4, 0},
		AnglesDefault   = {0.0,0.0},
	},  
	Arcade = {
		LocalPoint      = {-21.50,5.0,0.0},
		AnglesDefault   = {0.0,-8.0},
	}, 
}

local function head_pos_default(tab)
    if not tab then
	   tab = {}
	end

	tab.viewAngle = tab.viewAngle  or 110 -- FOV
	tab.hAngle    = tab.hAngle     or  0
	tab.vAngle    = tab.vAngle     or  0 -- angles down pilot view
	tab.x_trans   = tab.x_trans    or  0 -- moves pilot view forward 
	tab.y_trans   = tab.y_trans    or  20 -- moves view up
	tab.z_trans   = tab.z_trans    or  0 -- moves view to right seat
	tab.rollAngle = tab.rollAngle  or  0
	return tab
end

SnapViews = {
[1] = {-- player slot 1 (pilot)
		[1]  = head_pos_default({}),--Num 0
		[2]  = head_pos_default({}),--LWin + Num1 : Snap View 1 - 
		[3]  = head_pos_default({}),--LWin + Num2 : Snap View 2 - 
		[4]  = head_pos_default({}),--LWin + Num3 : Snap View 3 - 
		[5]  = head_pos_default({}),--LWin + Num4 : Snap View 4 - 
		[6]  = head_pos_default({}),--LWin + Num5 : Snap View 5 - Default view
		[7]  = head_pos_default({}),--LWin + Num6 : Snap View 6 - 
		[8]  = head_pos_default({}),--LWin + Num7 : Snap View 7 - 
		[9]  = head_pos_default({}),--LWin + Num8 : Snap View 8 -
		[10] = head_pos_default({}),--Num 9
		[11] = head_pos_default({}),--look at left  mirror
		[12] = head_pos_default({}),--look at right mirror
		[13] = head_pos_default({})--default view
	}
}
