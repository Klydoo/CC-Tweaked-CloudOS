os.pullEvent = os.pullEventRaw -- Disable termination

local CONFIG_PATH = "/os/Config/save.cfg"

local ui = require("/os/ui")
ui.HeaderInfo = {
    [1] = "Reset Save Config",
}
ui.Title = "Are you sure you want to reset Save Config?"
ui.StartOption = 1
ui.BackOption = 1
ui.Options = {
    [1] = "Back",
    [2] = "Confirm",
}

-- Display
ui:Draw()
ui:OnSelect(function(option)
    if option == 1 then
        shell.run("/os/settings.lua")
        return 1
    elseif option == 2 then
        if fs.exists(CONFIG_PATH) then
            shell.run("delete", CONFIG_PATH)
        end
        shell.run("/os/settings.lua")
        return 1
    end
end)