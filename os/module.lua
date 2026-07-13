local module = {
    HeaderInfo = {},
    Title = "",
    StartOption = 1,
    CurrentOption = 1,
    BackOption = -1,
    Options = {},
    TerminalRunning = false,
}

local w,h = term.getSize()
function module:GetSize() return w,h end

function module:PrintCentered(y,s)
    local x = math.floor((w - string.len(s))/2)
    term.setCursorPos(x,y)
    term.clearLine()
    term.write(s)
end

function module:Draw()
    term.clear()
    for i,v in ipairs(self.HeaderInfo) do
        term.setCursorPos(1,i)
        term.write(v)
    end
    
    if self.Options[self.CurrentOption] then
        term.setCursorPos(w-string.len(self.Options[self.CurrentOption]),1)
        term.write(self.Options[self.CurrentOption])
    end

    self:PrintCentered(math.floor(h/2)-3, "")
    self:PrintCentered(math.floor(h/2)-2, self.Title)
    self:PrintCentered(math.floor(h/2)-1, "")

    local mult = 0
    for i,v in ipairs(self.Options) do
        self:PrintCentered(math.floor(h/2)+mult, ((self.CurrentOption == i and string.format("[ %s ]", v)) or v))
        mult = mult + 1
    end
end

function module:OnSelect(callback)
    while not self.TerminalRunning do
        local e,p = os.pullEvent()
        if e == "key" then
            local key = p
            if key == keys.up then
                self.CurrentOption = (self.CurrentOption-1) < 1 and #self.Options or self.CurrentOption-1
                self:Draw()
            elseif key == keys.down then
                self.CurrentOption = (self.CurrentOption+1) > #self.Options and 1 or self.CurrentOption+1
                self:Draw()
            elseif key == keys.backspace and self.Options[self.BackOption] then
                self.CurrentOption = self.BackOption
                callback(self.CurrentOption)
                return
            elseif key == keys.enter then
                callback(self.CurrentOption)
                return
            end
        end
    end
end

return module