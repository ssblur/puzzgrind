_scact = 1
_scdia = 1
_scdpr = 3

function _dscene()
    local x = 8
    local y = 80
    local chr = s[_sact].stages[_scact].c
    clip()
    map(16*(s[_sact].stages[_scact].b - 1), 16, 0, 0, 16, 10)
    rectfill(0, y, 128, y+44, 1)
    rectfill(x-6, y-5, x-4+(4*#c[chr].name), y+4, 5)
    print(c[chr].name, x-4, y-3, 7)
    print("")
    print(sub(_scdial(), 1, _scdpr))
    print("\*9 \*9 \*9   \-d❎", x-4, y+32)
    local ch = chr - 1
    ch %= 100
	ch *= 4
    palt(0, false)
	map(
		(_gup>20 and 2 or 0) 
		+ ch, 
		0 + (chr > 100 and 14 or 0), 
		x+100, y-10, 
		2, 2
	)
    palt(0, true)
end

function _uscene()
    _scdpr += 1
    _scdpr = min(_scdpr, #_scdial())
    if _x() then
        _scdia += 1
        _scdpr = 3
        if _scdia > #s[_sact].stages[_scact].d then
            _scact += 1
            _scset()
        end
    end
end

function _scdial()
    return s[_sact].stages[_scact].d[_scdia]
end

function _scset()
    _ptt += _points
    resetboard()
    game = s[_sact].stages[_scact].t
    _scdia = 1
    _scdpr = 3
    if game == 1 then
        _lvllock = s[_sact].stages[_scact].l
        _pointcap = s[_sact].stages[_scact].g
    end
end

function _dfin()
    local x = 8
    local y = 32
    local ch = _ch - 1
	ch *= 4
	map(
		(_gup>20 and 2 or 0) 
		+ ch, 
		0, 
		x+90, y-4, 
		2, 2
	)
    print("story complete!!\n", x, y)
    print("points: ".._ptt)
    for k,v in pairs(s[_sact].stages[_scact].x) do
        if _scdia > 10*k then
            print(v)
        end
    end
    print("\*9 \*9 \*6   \-d❎", x-4, y+32)
end

function _ufin()
    _scdia += 1
    _scdia = min(_scdia, 200)
    if _x() then
        game = 0
    end
end