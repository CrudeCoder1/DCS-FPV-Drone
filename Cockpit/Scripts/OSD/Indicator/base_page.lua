dofile(LockOn_Options.script_path.."OSD/Indicator/definitions.lua")

local base 			 = CreateElement "ceMeshPoly"
base.name 			 = "base"
base.vertices 		 = {{-aspect, -1},
                        {-aspect,  1}, 
                        { aspect,  1},
                        { aspect, -1} }        
base.indices 		 = {0,1,2,2,3,0}
base.init_pos		 = {0,0,0}
base.material		 = MakeMaterial(nil,{25,3,3,150})
base.h_clip_relation = h_clip_relations.REWRITE_LEVEL 
base.level			 = 5
base.isdraw			 = true
base.change_opacity  = false
base.isvisible		 = false
AddElement(base)