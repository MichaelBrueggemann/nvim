-- require all files that should be loaded on startup of nvim

-- require all files in a given directory
local function require_files(directory)
    local this_dir = debug.getinfo(1, "S").source:sub(2):match("(.*/)") .. "/lua/" 
    local dir = this_dir .. directory
    local files = vim.loop.fs_scandir(dir)
    if not files then
	print("Error: Unable to acces directory: ", dir)
        return
    end

    for file in function() return vim.loop.fs_scandir_next(files) end do
        if file and file:match("%.lua$") then
    	    local concated_file = directory .. "/" .. file:gsub("%.lua$", "")
            require(concated_file)
        end
    end
end

-- check if a "service" (like "git", "tmux" or anything else) is installed on the system
function is_command_available(cmd)
    local handle = io.popen("command -v " .. cmd) -- try to get information about the service. If the service is missing, the output of this line will be "nil"
    local result = handle:read("*a")
    handle:close()
    return result ~= nil and result ~= ""
end


-- assigns the ".typ" filetype to "typst"
vim.filetype.add({
  extension = {
    typ = "typst",
  },
})

-- require setting files
require_files("settings")

-- require Language Server Protocol (LSP) files
require("lsp/lsp")

-- require all plugin configuration files
require_files("config")
