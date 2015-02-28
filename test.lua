local RedEnv = require "red_envelope"
local all = {}

for i = 1, 100000 do
    local total = 100--math.random(100,10000)
    local times = 10--math.random(2,100)
    local red_env = RedEnv.new(total,times, nil , nil ,0)
    local money = red_env:random()
    local s= "第"..i.."次：总数"..total.."，次数："..times.."："
    local tmp = 0
    for i, v in ipairs(money) do
        s = s .. v ..","
        tmp = tmp + v
        if all[i] == nil then
            all[i] = 0
        end
        all[i] = all[i] + v
    end
end

local a = ""
for k , v in pairs(all) do
    a = a .. k ..":".. v .. ","
end
print(a)
