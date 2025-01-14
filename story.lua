-- types of scene:
--  1: game
--  2: dialogue
--  3: victory screen

_sact = nil

s = {
    {
        char = 1,
        name = "hypehypehype",
        stages = {
            {
                t = 6, -- scene type
                b = 1, -- background
                c = 1, -- character (grime)
                d = {  -- dialogue
                    "what's up grimers, it's ya \nboi!",
                    "here with more crane gaming!",
                    "check out these \nfreshnasty moves!",
                }
            },
            {
                t = 1,
                l = 1, -- difficulty level
                g = 50, -- goal score
                d = "sick, right?" -- victory dialogue
            },
            {
                t = 6,
                b = 1,
                c = 101, -- tommy duck (npc)
                d = {
                    "hey man, what's-",
                    "what's up?",
                }
            },
            {
                t = 6,
                b = 1,
                c = 1,
                d = {
                    "chat watch this \ni'm gonna destroy this guy",
                }
            },
            {
                t = 1,
                l = 2,
                g = 200,
                d = "get rekt"
            },
            {
                t = 6,
                b = 2, -- outside
                c = 102, -- c0pt3r (npc)
                d = {
                    "nasty boy detected!",
                }
            },
            {
                t = 6,
                b = 2,
                c = 1, -- grime
                d = {
                    "damn straight!",
                    "(or gay i don't hate)"
                }
            },
            {
                t = 6,
                b = 2,
                c = 102, -- c0pt3r (npc)
                d = {
                    "match my blocks",
                }
            },
            {
                t = 1,
                l = 3,
                g = 350,
                d = "nice try nerd"
            },
            {
                t = 6,
                b = 3, -- sewer
                c = 1, -- grime
                d = {
                    "wasn't even close!",
                    "oh hey sludge",
                    "wanna go for a round of \ncranie?"
                }
            },
            {
                t = 6,
                b = 3,
                c = 2, -- sludge
                d = {
                    "...",
                    "...sure",
                    "but don't call it that"
                }
            },
            {
                t = 1,
                l = 4,
                g = 600,
                d = "cranie cranie cranie"
            },
            {
                t = 6,
                b = 4, -- desktop background
                c = 103, -- anonymous (npc)
                d = {
                    "anonymous donated $200",
                    "bet you can't break 1000"
                }
            },
            {
                t = 6,
                b = 4, -- desktop background
                c = 1, -- grime
                d = {
                    "oh you're on!",
                }
            },
            {
                t = 1,
                l = 5,
                g = 1000,
                d = "level 5 hype lesgo!!!"
            },
            {
                t = 7,
                x = { -- items listed after points
                    "subs +50",
                    "clout +100",
                    "diseases +all"
                }
            }
        }
    }
}