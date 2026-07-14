os.pullEvent = os.pullEventRaw -- Disable termination

local ui = require("/os/ui")
ui.HeaderInfo = {
    [1] = "CloudOS",
    [2] = "Computer ID: " .. os.getComputerID(),
    [3] = "Computer Label: " .. (os.computerLabel() or "NONE"),
}
ui.Title = "Start Menu"
ui.StartOption = 1
ui.Options = {
    [1] = "Terminal",
    [2] = "Programs",
    [3] = "Settings",
}

-- Display
ui:Draw()
ui:OnSelect(function(option)
    if option == 1 then
        shell.run("/os/terminal.lua")
        return 1
    elseif option == 2 then
        shell.run("/os/programs.lua")
        return 1
    elseif option == 3 then
        shell.run("/os/settings.lua")
        return 1
    end
end)
