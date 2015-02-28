local RedEnv = require "red_envelope"
local run_times = 100

local random_total_min = 100
local random_total_max = 10000

local random_times_min = 2
local random_times_max = 10

for i = 1, run_times do
    local total = math.random(random_total_min, random_total_max)
    local times = math.random(random_times_min,random_times_max)
    local red_env = RedEnv.new(total,times)
    local money = red_env:random()
    local s= "times:"..i.." total:"..total.." random times:"..times.." ,"
    local tmp = 0
    for i, v in ipairs(money) do
        s = s .. v ..","
        tmp = tmp + v
    end
    print(s)
end

