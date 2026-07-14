os.pullEvent = os.pullEventRaw -- Disable termination

local ui = require("/os/ui")
ui.HeaderInfo = {
    [1] = "Settings",
}
ui.Title = "Settings Menu"
ui.StartOption = 1
ui.BackOption = 3
ui.Options = {
    [1] = "Uninstall OS",
    [2] = "Reset Save Config",
    [3] = "Back",
}

-- Display
ui:Draw()
ui:OnSelect(function(option)
    if option == 1 then
        shell.run("/os/Settings/uninstallOS.lua")
        return 1
    elseif option == 2 then
        shell.run("/os/Settings/resetSaveConfig.lua")
        return 1
    elseif option == 3 then
        shell.run("/os/menu.lua")
        return 1
    end
end)