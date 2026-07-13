os.pullEvent = os.pullEventRaw -- Disable termination

local module = require("/os/module")
module.HeaderInfo = {
    [1] = "Reset Save Config",
}
module.Title = "Are you sure you want to reset Save Config?"
module.StartOption = 1
module.BackOption = 1
module.Options = {
    [1] = "Back",
    [2] = "Confirm",
}
module.TerminalRunning = false

-- Display
module:Draw()
module:OnSelect(function(option)
    if option == 1 then
        shell.run("/os/settings.lua")
    elseif option == 2 then
        if fs.exists("/os/saveConfig.cfg") then
            shell.run("delete", "/os/saveConfig.cfg")
        end
        shell.run("/os/settings.lua")
    end
end)