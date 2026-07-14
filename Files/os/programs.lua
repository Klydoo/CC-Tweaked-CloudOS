os.pullEvent = os.pullEventRaw -- Disable termination

local ui = require("/os/ui")
ui.HeaderInfo = {
    [1] = "Programs",
}
ui.Title = "Programs List"
ui.StartOption = 1
ui.BackOption = 1
ui.Options = {
    [1] = "Back",
}

-- Display
ui:Draw()
ui:OnSelect(function(option)
    if option == 1 then
        shell.run("/os/menu.lua")
        return 1
    end
end)