dofile(LockOn_Options.script_path.."OSD/Indicator/definitions.lua")

local modePos = {0.9*aspect,0.9}
addText("ACROlabel", "ACRO", modePos, {{"parameter_in_range",0,0}}, {"FlightMode"})
addText("Anglelabel", "ANGLE", modePos, {{"parameter_in_range",0,1}}, {"FlightMode"})
addText("Horizlabel", "HORIZON", modePos, {{"parameter_in_range",0,2}}, {"FlightMode"})

addText("ARMlabel", "DISARMED", {0,0.94}, {{"parameter_in_range",0,0}}, {"isArmed"})

addText("battVoltlabel", nil, {-0.9*aspect,0.95}, {{"text_using_parameter",0,0}}, {"BatteryVoltage"},{"%.1fv"})
addText("cellVoltlabel", nil, {-0.9*aspect,0.9}, {{"text_using_parameter",0,0}}, {"CellVoltage"},{"%.1fv"})
addText("chargelabel", nil, {-0.9*aspect,0.85}, {{"text_using_parameter",0,0}}, {"BatteryPercent"},{"%.0f %%"})




------- Control indicators ---------------
local cntrlWidth = 0.2
local cntrlLine_L = {-0.3, -0.8-cntrlWidth/2}
local cntrlLineH_L = {-0.3-cntrlWidth/2, -0.8			  }
local cntrlLineV_L = {-0.3,				 -0.8-cntrlWidth/2}
local cntrlLine_R = {0.3, -0.8}
local cntrlLineH_R = {0.3-cntrlWidth/2,  -0.8			  }
local cntrlLineV_R = {0.3,				 -0.8-cntrlWidth/2}


addLine("LcntrlVertScale", cntrlWidth, cntrlLineV_L, 0, nil, nil)
addLine("LcntrlHorzScale", cntrlWidth, cntrlLineH_L, -90, nil, nil)
addCircle("LcntrlDot", 0.01, 20, cntrlLine_L, {"THROTTLE_INPUT","YAW_INPUT"}, {{"move_up_down_using_parameter",0, cntrlWidth},{"move_left_right_using_parameter",1, cntrlWidth/2}})


addLine("RcntrlVertScale", cntrlWidth, cntrlLineV_R, 0, nil, nil)
addLine("RcntrlHorzScale", cntrlWidth, cntrlLineH_R, -90, nil, nil)
addCircle("RcntrlDot", 0.01, 20, cntrlLine_R, {"PITCH_INPUT","ROLL_INPUT"}, {{"move_up_down_using_parameter",0, -cntrlWidth/2},{"move_left_right_using_parameter",1, cntrlWidth/2}})



------ screen static when battery dies -----------
addTexPoly("screenStatic1", MakeMaterial("FPV_Drone_Static1.png",{255,255,255,255}), {"ScreenStatic"}, {{"parameter_in_range",0,1}} )
addTexPoly("screenStatic2", MakeMaterial("FPV_Drone_Static2.png",{255,255,255,255}), {"ScreenStatic"}, {{"parameter_in_range",0,2}} )
addTexPoly("screenStatic3", MakeMaterial("FPV_Drone_Static3.png",{255,255,255,255}), {"ScreenStatic"}, {{"parameter_in_range",0,3}} )
addTexPoly("screenStatic4", MakeMaterial("FPV_Drone_Static4.png",{255,255,255,255}), {"ScreenStatic"}, {{"parameter_in_range",0,4}} )
