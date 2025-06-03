local DbOption  = require('Options.DbOption')
local i18n	    = require('i18n')

local _ = i18n.ptranslate

return {
	
	maxYawRate	= DbOption.new():setValue(100):slider(DbOption.Range(20,400)),
	maxPitchRollRate	= DbOption.new():setValue(200):slider(DbOption.Range(20,500)),
	maxAngle	= DbOption.new():setValue(50):slider(DbOption.Range(10,60)),
	gravity		= DbOption.new():setValue(1.1):slider(DbOption.Range(1,1.5)),
}
