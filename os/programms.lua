os.pullEvent = os.pullEventRaw -- Disable termination

local module = require("/os/module")
module.HeaderInfo = {
    [1] = "Programms",
}
module.Title = "Programms List"
module.StartOption = 1
module.BackOption = 1
module.Options = {
    [1] = "Back",
}
module.TerminalRunning = false

-- Display
module:Draw()
module:OnSelect(function(option)
    if option == 1 then
        shell.run("/os/menu.lua")
    end
end)
