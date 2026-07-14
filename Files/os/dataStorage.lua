local CONFIG_PATH = "/os/Config/save.cfg"

local dataStorage = {
    Data = {
        
    }
}

function dataStorage:Load()
    if not fs.exists(CONFIG_PATH) then self:Save() end
    local file = fs.open(CONFIG_PATH, "r")
    self.Data = textutils.unserialise(file.readAll())
end

function dataStorage:Save()
    local file = fs.open(CONFIG_PATH, "w")
    file.write(textutils.serialise(self.Data))
    file.close()
end

return dataStorage