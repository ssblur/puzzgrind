-- reset the board
function resetboard()
	_b = {}
	for i=1,h do
		_b[i] = {}
	end
	progress = 0
	max_prog = 40
	ilines = 3
	_points = 0
	_lvl = 0
	reserved = nil
end
resetboard()

-- draw board
function _dboard()	
	local y = 96 - h * 8
	
	local p = progress / max_prog
	local s = w*8 * p
	local sx = 124-w*8
	line(sx, 106, sx+s, 106)
	
	for j=h,1,-1 do
		y += 8
		local x = 116 - w * 8
		for i=1,w do 
			x += 8
			local s = get(i,j)
			if s then
				spr(s, x, y)
			elseif crane==i then
				spr(34, x, y)
			else
				spr(32, x, y)
			end
		end
	end
end

-- update board
function _uboard()
	progress += diff()
	if ilines > 0 
		and progress >= 3 then
		ilines -= 1
		progress = max_prog
	end
	
	if progress >= max_prog then
		progress = 0
		local nb = {}
		for i,v in pairs(_b) do
			if i == h then
				for _,_ in pairs(v) do
					gameover()
				end
			else
				nb[i+1] = v
			end
		end
		nb[1] = {}
		for i=1,w do
			local t = flr(rnd(5)) + 1
			while rep(nb,i,t) do
				t = flr(rnd(5)) + 1
			end
			nb[1][i] = t
		end
		_b = nb
		dwatch()
		chkb()
	end
end

-- end the game
function gameover() 
	game = 2
	_xdel = 20
	_ihi = save_score()
	dover()
end

-- new tile helper
function rep(brd, x, t)
	if brd[2][x]==t then
		return true
	end
	if brd[1][x-1]==t then
		return true
	end
	return false
end
crane = 1 -- crane pos
reserved = nil -- held block
-- draw crane
function _dcrane()
	local y = 88 - h * 8
	local x = 116-w*8
	x += crane*8
	spr(18, x, y)
	if reserved then
		spr(reserved, x, y+8)
		spr(16, x-8, y+7, 1, 1)
		spr(16, x+8, y+7, 1, 1, true)
	else 
		spr(17, x-8, y+7, 1, 1)
		spr(17, x+8, y+7, 1, 1, true)
	end
end

mcool = 0 -- left/right cooldown
-- update crane
function _ucrane()
	if mcool < 0 then
		if btn(➡️) and crane<w then
			mcool = 3
			crane += 1
			sfx(0, 1)
		end
		if btn(⬅️) and crane>1 then
			mcool = 3
			crane -= 1
			sfx(0, 1)
		end
	else
		mcool -= 1
	end
	if _x() then
		if reserved then
			for i=h,1,-1 do
				if reserved then
					if (i==1 
						or _b[i-1][crane])
						and not _b[i][crane] then
						_b[i][crane] = reserved
						reserved = nil
						chkb()
					end
				end
			end
		else
			for i=h,1,-1 do
				if not reserved then
					if _b[i][crane] then
						if _b[i][crane]==5 then
							return
						end
						reserved = _b[i][crane]
						_b[i][crane] = nil
						chkb()
					end
				end
			end
		end
	end
end

-- safely get tile
function get(x, y)
	if x<1 or x>w 
		or y<1 or y>h then
		return nil	
	end
	return _b[y][x]
end

-- safely set tile
function set(x,y,v)
	if x<1 or x>w 
		or y<1 or y>h then
		return nil
	end
	_b[y][x] = v
end

-- swap two tiles
function swap(x1,y1,x2,y2)
	local t = get(x1,y1)
	set(x1,y1,get(x2,y2))
	set(x2,y2,t)
end

-- check for clears
function chkb()
	for x=1,w,1 do
		for y=1,h,1 do
			local t = get(x,y)
			if t!=nil then
				local c = 1
				c += get(x-1,y)==t 
					and 1 or 0
				c += get(x+1,y)==t 
					and 1 or 0
				c += get(x,y-1)==t 
					and 1 or 0
				c += get(x,y+1)==t 
					and 1 or 0
				if c >= 3 then
					clrat(x,y)
					settle()
					dmatch()
					chkb()
				end
			end
		end
	end
end

-- clear helper
function _clr(x,y,v)
	if get(x,y)==v
		or get(x,y)==5 then
			clrat(x,y)
		end
end

-- start clearing at
function clrat(x, y)
	local t = get(x, y)
	set(x,y,nil)
	if t!=nil and t!=5 then
		sfx(1, 0)
		point()
		_clr(x+1,y,t)
		_clr(x-1,y,t)
		_clr(x,y+1,t)
		_clr(x,y-1,t)
	end
end

-- settle board
function settle() 
	for y=1,h,1 do
		for x=1,w,1 do
			if get(x,y) and y>1
				and not get(x,y-1) then
				swap(x,y,x,y-1)	
				settle()
			end
		end
	end
end