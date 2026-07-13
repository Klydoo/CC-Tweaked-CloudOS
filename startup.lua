local module = require("/os/module")
local w,h = module:GetSize()

module.Title = "CloudOS"
module:Draw()
module:PrintCentered(math.floor(h/2), "Loading...")

local loadingCount = 0
while loadingCount < 10 do
    loadingCount = loadingCount + 1
    local ProcessText = ""
    for _ = 1,loadingCount do ProcessText = ProcessText.."#" end
    module:PrintCentered(math.floor(h/2)+1, ProcessText)
    sleep(0.3)
end
sleep(1)
shell.run("/os/menu.lua")