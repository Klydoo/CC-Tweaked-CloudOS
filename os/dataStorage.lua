local dataStorage = {
    Data = {
        
    }
}

function dataStorage:Load()
    if not fs.exists("/os/saveConfig.cfg") then self:Save() end
    local file = fs.open("/os/saveConfig.cfg", "r")
    self.Data = textutils.unserialise(file.readAll())
end

function dataStorage:Save()
    local file = fs.open("/os/saveConfig.cfg", "w")
    file.write(textutils.serialise(self.Data))
    file.close()
end

return dataStorage