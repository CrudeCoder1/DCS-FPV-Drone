dofile(LockOn_Options.common_script_path.."elements_defs.lua")

SetCustomScale(1.0)


DEFAULT_LEVEL = 5
--NOCLIP_LEVEL  = DEFAULT_LEVEL - 1

aspect = LockOn_Options.screen.aspect
--local width = LockOn_Options.screen.width
--local height = LockOn_Options.screen.height

local white_Color ={230,230,230,255}
local ttf_font = {class = "ceUITTF", ttf = LockOn_Options.common_script_path.."../../../../WebGUI/fonts/OpenSans-Regular.ttf", size = 100}
local TTF  = MakeFont(ttf_font, white_Color)


function AddElement(object)
	object.screenspace = ScreenType.SCREENSPACE_TRUE
    object.use_mipfilter = true
    Add(object)
end

function addText(name, value, pos, controllers, elementParams, formats)
	local txt = CreateElement "ceStringPoly"
	txt.name               = name
	txt.material           = TTF--MakeFont({used_DXUnicodeFontData = "font_arial_17"},{230,230,230,255})
	txt.additive_alpha	  = false
	txt.collimated		  = false
	txt.use_mipfilter      = true
	
	if parent ~= nil then
		txt.parent_element = parent
	end
	
	if controllers ~= nil then
		if type(controllers) == "table" then
			txt.controllers = controllers	
		end
	end
	txt.element_params  = elementParams
	
	pos = pos or {0, 0}
	txt.init_pos       	  = {pos[1], pos[2], 0}
	
	txt.h_clip_relation = h_clip_relations.COMPARE
	txt.level 		    = DEFAULT_LEVEL
	
	txt.alignment = align or "CenterCenter"
	txt.stringdefs = {0.005, 0.005, 0, 0}
		
	if value ~= nil then
		txt.value = value
	end
	
	txt.formats 		= formats 
	
	AddElement(txt)
	return txt
end

function addTexPoly(name, material, elementParams, controllers)
local tex          = CreateElement "ceTexPoly"
tex.name           = name
tex.material       = material
tex.vertices   	   = {{-aspect, 1}, -- affects sizing (4 corners of tga file)
					  { aspect, 1},
					  { aspect,-1},
					  {-aspect,-1}}
tex.indices		   = {0,1,2,2,3,0}
tex.tex_coords	   = {{0,0},{1,0},{1,1},{0,1}}
--tex.init_pos       = pos
tex.alignment      = "CenterCenter"
tex.element_params = elementParams
tex.controllers    = controllers 
--tex.parent_element = parent
AddElement(tex)
return tex
end

-- line
-- rot (CCW in degrees from up)
-- pos (position of beginning of the line)
function addLine(name, length, pos, rot, params, controllers)
	local line      	  = CreateElement "ceSMultiLine"
	line.name             = name
	line.material         = MakeMaterial(nil,white_Color)	
	--line.parent_element   = parent	
	line.controllers 	  = controllers
	line.element_params	  = params
	pos = pos or {0, 0}
	line.init_pos         = {pos[1], pos[2], 0}	
	line.h_clip_relation  = h_clip_relations.COMPARE
	line.level 		      = DEFAULT_LEVEL
	if rot ~= nil then
		line.init_rot   = {rot}
	end		
	line.vertices   = {{0, 0}, {0, length}}
	line.indices    = {0, 1}	
	line.thickness  = 10
	line.fuzziness  = 1.2
	AddElement(line)
	return line
end


function addCircle(name, radius, sides, pos, params, controllers)
local circle	 = CreateElement "ceMeshPoly"
circle.name	 = name 
circle.material = MakeMaterial(nil,white_Color)	
set_circle(circle, radius, 0, nil, sides)  -- name, outer R, inner R, arc, sides  
pos = pos or {0, 0}
circle.init_pos       	 = {pos[1], pos[2], 0}
--circle.parent_element 	= parent
circle.additive_alpha 	= false
circle.h_clip_relation 	= h_clip_relations.COMPARE
circle.level 			= DEFAULT_LEVEL
circle.element_params	= params
circle.controllers		= controllers
circle.collimated		= false
AddElement(circle)	
return circle
end
