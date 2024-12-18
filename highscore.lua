cartdata("puzzgrind_high")

function save_score()
    if _points == 0 then return end
    local s = scores()
    s[#s+1] = {_ch, _points}
    local ns = {}
    for i=0,9,1 do
        if #s>0 then
            ns[i] = _picktop(s)
        end
    end
    for i,v in pairs(ns) do
        dset(i*2, v[1]) 
        dset(i*2 + 1, v[2])
    end
    return ns[0][2] == _points
end

function scores()
    local scores = {}
    for i=0,9 do
        local s = { dget(i*2), dget(i*2 + 1) }
        if s[1] == 0 then return scores end
        scores[i+1] = s
    end
    return scores
end

function _dscores()
    local s = scores()
    print("high scores:", 2, 2)
    if #s == 0 then
        print("no scores saved...")
    end
    for k,v in pairs(s) do
        if v[1]>0 and k<6 then
            local y = 10+(k-1)*18
            local ch = v[1] - 1
            ch *= 4
            map(2+ch,0,8,y,2,2)
            print(c[v[1]].name, 26, y+5, 7)
            print(v[2], 64, y+5, 7)
        end
    end
    print("press ❎ to return", 2, 120)
end

function _uscores()
    if _x() then
        game = 0
    end
end

function _picktop(t)
    local i = nil
    for k,v in pairs(t) do
        if i==nil or v[2] > t[i][2] then
            if v[1] > 0 then
                i = k
            end
        end
    end
    local v = t[i]
    t[i] = nil
    return v
end