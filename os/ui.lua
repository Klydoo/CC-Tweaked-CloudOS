local ui = {
    HeaderInfo = {},
    Title = "",
    StartOption = 1,
    CurrentOption = 1,
    BackOption = -1,
    Options = {},
    Timers = {},
}

local w,h = term.getSize()
function ui:GetSize() return w,h end

function ui:PrintCentered(y,s)
    local x = math.floor((w - string.len(s))/2)
    term.setCursorPos(x,y)
    term.clearLine()
    term.write(s)
end

function ui:Draw()
    term.clear()
    for i,v in ipairs(self.HeaderInfo) do
        term.setCursorPos(1,i)
        term.write(v)
    end
    
    if self.Options[self.CurrentOption] then
        term.setCursorPos(w-string.len(self.Options[self.CurrentOption]),1)
        term.write(self.Options[self.CurrentOption])
    end

    self:PrintCentered(math.floor(h/2)-4, "")
    self:PrintCentered(math.floor(h/2)-3, self.Title)
    self:PrintCentered(math.floor(h/2)-2, "")

    local mult = 0
    for i,v in ipairs(self.Options) do
        self:PrintCentered(math.floor(h/2)+mult, ((self.CurrentOption == i and string.format("[ %s ]", v)) or v))
        mult = mult + 1
    end
end

function ui:Timer(seconds, callback)
    local id = os.startTimer(seconds)
    self.Timers[id] = callback
end

function ui:OnSelect(callback)
    while true do
        local e,p = os.pullEvent()

        if e == "timer" and self.Timers[p] then
            local cb = self.Timers[p]
            self.Timers[p] = nil
            cb()
        elseif e == "key" then
            local key = p
            if key == keys.up then
                self.CurrentOption = (self.CurrentOption-1) < 1 and #self.Options or self.CurrentOption-1
            elseif key == keys.down then
                self.CurrentOption = (self.CurrentOption+1) > #self.Options and 1 or self.CurrentOption+1
            elseif key == keys.backspace and self.Options[self.BackOption] then
                self.CurrentOption = self.BackOption
                if callback(self.CurrentOption) then return end
            elseif key == keys.enter then
                if callback(self.CurrentOption) then return end
            end
        end
        self:Draw()
    end
end

return ui