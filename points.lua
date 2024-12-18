_points = 0
_ptturn = 0 -- points this turn
_lvl = 0 -- level

-- award point
function point()
	_points += lvl()
	_lvl += 1
	_ptturn += 1
	if _ptturn > 3 then
		_points += _ptturn-3*lvl()
	end
end

-- get level
function lvl()
	return 1+flr(sqrt(_lvl/15))
end

-- difficulty scaling
_diff = {
	0.5,
	0.9,
	1.2,
	1.5,
	2
}
-- get difficulty
function diff()
	return _diff[lvl()] or 2.5
end

-- draw points
function _dpoint()
	print("score", 8, 10, 6)
	print(_points, 8, 16, 7)
	print("level "..lvl())
end

-- update points
function _upoint()
	_ptturn = 0
end