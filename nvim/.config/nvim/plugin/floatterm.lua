local state = {
    floating = {
        buf = -1,
        win = -1,
    }
}

local function CreateFloatingWindow(opts)
    opts = opts or {}

    local width = opts.width or math.floor(vim.o.columns * 0.8)
    local height = opts.height or math.floor(vim.o.lines * 0.8)

    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    local buf
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
    end

    local win_config = {
        relative = "editor",
        width = width,
        height = height,
        col = col,
        row = row,
        style = "minimal",
        border = "rounded",
    }

    local win = vim.api.nvim_open_win(buf, true, win_config)
    return { buf = buf, win = win }
end

local function ToggleTerminal(program)
    program = program or vim.o.shell

    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = CreateFloatingWindow { buf = state.floating.buf }

        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            vim.cmd.terminal(program)
            vim.cmd.startinsert()
        end
    else
        vim.api.nvim_win_hide(state.floating.win)
    end
end

local function ClearBuffer()
    state.floating.buf = -1
    state.floating.win = -1
end

vim.api.nvim_create_autocmd("TermClose", {
    callback = function(args)
        if args.buf == state.floating.buf then
            vim.schedule(function()
                if vim.api.nvim_win_is_valid(state.floating.win) then
                    vim.api.nvim_win_hide(state.floating.win)
                end
                state.floating.buf = -1
                state.floating.win = -1
            end)
        end
    end,
})

-- Commands
vim.api.nvim_create_user_command("FloatTerm", function()
    ToggleTerminal()
end, {})

vim.api.nvim_create_user_command("FloatTermClearBuff", ClearBuffer, {})

vim.api.nvim_create_user_command("Lazygit", function(opts)
    ToggleTerminal(opts.args ~= "" and opts.args or "lazygit")
end, {
    nargs = "?",
})

-- Keymaps
vim.keymap.set({ "n", "t" }, "<leader>tt", function()
    ToggleTerminal()
end)

vim.keymap.set({ "n", "t" }, "<leader>cb", ClearBuffer)

vim.keymap.set("n", "<leader>lg", "<cmd>Lazygit<CR>")

