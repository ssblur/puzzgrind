_ch = 3 -- selected character
_cdial = "" -- current dialogue
_cdiap = 0 -- dialogue progress
_cdiat = 0 -- dialogue timer

-- draw character + dialogue
function _dchar()
	local ch = _ch - 1
	local y = 86
	ch *= 4
	map(
		(_gup>20 and 2 or 0) 
		+ ch, 
		0, 
		0,	y, 
		2, 2
	)
	print(c[_ch].name,
		18, y+2, 7)
	print(c[_ch].gang,
		18, y+8, 6)
	
	
	if _cdiat > 0 then
		local d = 
			sub(_cdial, 0, _cdiap)
		y -= 23
		rectfill(0, y, 66, y+22, 1)
		print(d, 2, y+2, 7)
	end
end

-- update character + dialogue
function _uchar()
	_cdiap = min(_cdiap+1, 
		#_cdial)
	_cdiat = max(_cdiat-1,0)
end

-- random from table
function rndt(t)
	return t[ceil(rnd(#t))]
end

-- watch dialogue
function dwatch()
	if _cdiat > 0 then
		return nil
	end
	_cdial = rndt(c[_ch].watch)
	_cdiap = 2
	_cdiat = 150
end

-- match dialogue
function dmatch()
	_cdial = rndt(c[_ch].match)
	_cdiap = 2
	_cdiat = 150
end

-- start dialogue
function dstart()
	_cdial = rndt(c[_ch].start)
	_cdiap = 2
	_cdiat = 200
end

-- game over dialogue
function dover()
	_cdial = rndt(c[_ch].over)
	_cdiap = 2
	_cdiat = 200
end