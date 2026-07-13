os.pullEvent = os.pullEventRaw -- Disable termination

local module = require("/os/module")
module.HeaderInfo = {
    [1] = "Settings",
}
module.Title = "Settings Menu"
module.StartOption = 1
module.BackOption = 3
module.Options = {
    [1] = "Uninstall OS",
    [2] = "Reset Save Config",
    [3] = "Back",
}
module.TerminalRunning = false

-- Display
module:Draw()
module:OnSelect(function(option)
    if option == 1 then
        shell.run("/os/Settings/uninstallOS.lua")
    elseif option == 2 then
        shell.run("/os/Settings/resetSaveConfig.lua")
    elseif option == 3 then
        shell.run("/os/menu.lua")
    end
end)