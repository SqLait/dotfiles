local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local path = "/extra/current_color.lua"
local globalTheme = 0

local function theme_picker(opts)
    opts = opts or {}

    -- Get the current buffer info
    local bufnr = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")

    -- Get Vim colorschemes (excluding unwanted Gruvbox)
    local vim_colors = vim.fn.getcompletion("", "color") or {}
    for i = #vim_colors, 1, -1 do
        if vim_colors[i] == "gruvbox" then
            table.remove(vim_colors, i) -- Remove default Gruvbox from theme pack
        end
    end
    table.insert(vim_colors, "gruvbox") -- Ensure ellisonleao/gruvbox.nvim is listed

    -- Detect current colorscheme
    local current_theme = vim.g.colors_name or "default"
    local current_theme_index = 1
    for idx, theme in ipairs(vim_colors) do
        if theme == current_theme then
            current_theme_index = idx
            break
        end
    end

    -- Telescope picker
    pickers
        .new(opts, {
            prompt_title = "Select a Theme",
            finder = finders.new_table({ results = vim_colors }),
            sorter = sorters.get_generic_fuzzy_sorter(),
            default_selection_index = current_theme_index,
            attach_mappings = function(prompt_bufnr, map)
                actions.select_default:replace(function()
                    local selection = action_state.get_selected_entry()[1]
                    actions.close(prompt_bufnr)

                    vim.cmd("colorscheme " .. selection)
                    print("Vim colorscheme set to: " .. selection)

                    -- Persist selected colorscheme
                    local config_file = vim.fn.stdpath("config") .. path
                    local file = io.open(config_file, "w")
                    if file then
                        globalTheme = selection
                        file:write('vim.cmd("colorscheme ' .. selection .. '")\n')
                        file:close()
                        print("Colorscheme persisted: " .. selection)
                    else
                        print("Failed to persist colorscheme.")
                    end
                end)

                -- Revert on ESC/Ctrl-c
                map("i", "<ESC>", function()
                    actions.close(prompt_bufnr)
                    vim.cmd("colorscheme " .. current_theme)
                    print("Reverted to original colorscheme: " .. current_theme)
                end)

                map("i", "<C-c>", function()
                    actions.close(prompt_bufnr)
                    vim.cmd("colorscheme " .. current_theme)
                    print("Reverted to original colorscheme: " .. current_theme)
                end)

                return true
            end,
            previewer = previewers.new_buffer_previewer({
                define_preview = function(self, entry, _)
                    local theme_name = entry.value
                    vim.cmd("colorscheme " .. theme_name)
                    vim.cmd("redraw!")
                    vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, lines)
                    vim.api.nvim_buf_set_option(self.state.bufnr, "filetype", filetype)
                end,
            }),
        }):find()
end

-- Create the custom command
vim.api.nvim_create_user_command("PickThemery", theme_picker, {})

-- Load persisted theme on startup
local color_file = vim.fn.stdpath("config") .. path
local ok, _ = pcall(dofile, color_file)
if not ok then
    vim.cmd("colorscheme gruvbox") -- Default to ellisonleao's gruvbox if none found
end

