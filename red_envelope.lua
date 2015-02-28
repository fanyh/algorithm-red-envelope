local mt = {}
mt.__index = mt
function mt:operation_molecule()
    local molecules, denominator  = {}, 0
    for i = 1, self.portion do
        local value = math.random(1,math.random(self.min, self.max))   --second random todo change final denominator for everytimes
        table.insert(molecules, value)
        denominator  = denominator  + value
    end

    return molecules, denominator
end

function mt:random()
    local balance = self.total - self.portion * self.default
    local molecules, denominator = self:operation_molecule(self.portion, self.min, self.max)
    local money, tmp = {}, 0
    for i = 1, self.portion - 1 do
        local val = math.floor(self.default + molecules[i]/denominator* balance)
        table.insert(money, val)
        tmp = tmp + val
    end

    table.insert(money, self.total - tmp)   --it large a little then before n-1 times random value

    return money
end

local M = {}
function M.new(total, portion, min, max, default)
    local self = {}
    self.default =  default or 1    --keep least val
    self.min = min or 100           --this is a weight ,let random look more exciting
    self.max = max or 10000
    self.total = total
    self.portion = portion
    setmetatable(self, mt)
    return self
end

return M
