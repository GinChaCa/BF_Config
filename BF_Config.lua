print("Loading Config: " .. _G.cfig)
local url
local main = Username

wait(0.3)

-- Function to check if the player's name is in the 'main' table
local function isInMain(playerName)
    for _, name in ipairs(main) do
        if name == playerName then
            return true
        end
    end
    return false
end

if isInMain(game.Players.LocalPlayer.Name) then
    print("main acc")
    url = "https://raw.githubusercontent.com/Milleu830/BFcfig/main/main.json"
else
    if _G.cfig == "Trial" then
        print("not main")
        url = "https://raw.githubusercontent.com/Milleu830/BFcfig/main/Trial.json"
    elseif _G.cfig == "V3" then
        print("not main")
        url = "https://raw.githubusercontent.com/Milleu830/BFcfig/main/V3.json"
    elseif _G.cfig == "Farm" then
        print("not main")
        url = "https://raw.githubusercontent.com/Milleu830/BFcfig/main/Farm.json"
    elseif _G.cfig == "Frag" then
        print("not main")
        url = "https://raw.githubusercontent.com/GinChaCa/BF_Config/main/Farm_Frag.json"
    elseif _G.cfig == "FragBF" then
        print("not main")
        url = "https://raw.githubusercontent.com/Milleu830/BFcfig/main/Frag.json"
    elseif _G.cfig == "Gat" then
        print("not main")
        url = "https://raw.githubusercontent.com/GinChaCa/BF_Config/main/Gat.json"
    elseif _G.cfig == "Clean" then
        print("not main")
        url = "https://raw.githubusercontent.com/GinChaCa/BF_Config/main/Clean.json"
    elseif _G.cfig == "SGT" then
        print("not main")
        url = "https://raw.githubusercontent.com/GinChaCa/BF_Config/main/SGT.json"
    end
end

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerName = player.Name  -- Extract player's name as a string

-- Folder and filename setup
local folder = "Banana Cat Hub"
local filename = playerName .. "-BFNew.json"  -- Use player's name for the filename

-- Function to delete the folder and all files inside
local function deleteFolderContents(folder)
    if isfolder(folder) then
        for _, file in ipairs(listfiles(folder)) do
            delfile(file)
        end
        delfolder(folder)
    end
end

-- Delete the folder and recreate it
deleteFolderContents(folder)
makefolder(folder)

-- Check if the URL is set before proceeding
if url then
    local response = game:HttpGet(url)
    
    -- Decode JSON response into a Lua table
    local config = HttpService:JSONDecode(response)
    
    wait(0.3)
    print("write cfig")
    writefile(folder .. "/" .. filename, HttpService:JSONEncode(config))
else
    warn("URL not set. Configuration may not have been loaded.")
end

wait(0.2)
print("loading script")
