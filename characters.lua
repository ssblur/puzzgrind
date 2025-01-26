local _cnpc = {
    match = {"     "},
    watch = {"     "},
    start = {"     "},
    over = {"     "},
    gang = "     "
}
_cnpc.__index = _cnpc

c = {
    {
        name = "grime",
        gang = "dank krew",
        match = {
            "radicool!\n  (radical+cool)",
            "sick moves!",
            "niiiiiiiice",
            "that was dank",
            "schnice"
        },
        watch = {
            "gotta watch \nout",
            "that's a lotta\nblocks, damn",
            "i have every \ndisease",
            "fr?"
        },
        start = {
            "let's get nasty!",
            "i'm on it"
        },
        over = {
            "ugh! you reek!",
            "this stinks...."
        }
    },
    {
        name = "sludge",
        gang = "dank krew",
        match = {
            "..."
        },
        watch = {
            "..."
        },
        start = {
            "...fine"
        },
        over = {
            "...pathetic"
        }
    },
    {
        name = "arcade",
        gang = "glitch h.",
        match = {
            "that's cool,\ni guess...",
            "sweet",
            "(:",
            "lol nice"
        },
        watch = {
            ":/",
            "wait, fr?"
        },
        start = {
            "sure, let's go"
        },
        over = {
            "whatever...",
            "just hit ❎ already"
        }
    },
    {
        name = "bashi",
        gang = "glitch h.",
        match = {
            "bashi blast",
            "pog"
        },
        watch = {
            "[redacted]",
            " ",
            "come on"
        },
        start = {
            "fine",
            "let's do this..."
        },
        over = {
            "goddammit",
            "really?"
        }
    },
    {
        name = "shambo",
        gang = "street rats",
        match = {
            "this is like\nthat time...",
            "let's goooooo"
        },
        watch = {
            "ew, i got some\nblock on me",
            "unlucky!",
            "aw shit"
        },
        start = {
            "luck's on our\nside!",
            "let's roll the\ndice!"
        },
        over = {
            "better luck next time!",
            "ouch! unlucky!"
        }
    },
    {
        name = "flow",
        gang = "street rats",
        match = {
            "get it twisted",
            "i always win"
        },
        watch = {
            "ugh... not cool",
            "i still got this"
        },
        start = {
            "go with the flow!",
            "let's go!"
        },
        over = {
            "you'll find your rhythm!",
            "there's always next time"
        }
    },
    [101] = {name = "tommy"},
    [102] = {name = "c0pt3r"},
    [103] = {name = "anonymous"},
}
setmetatable(c[101], _cnpc)
setmetatable(c[102], _cnpc)
setmetatable(c[103], _cnpc)