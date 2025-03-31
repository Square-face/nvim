local M = {}
-- Generate a random float between -100 and 100
local function random_float()
    return (math.random() * 200) - 100
end

-- Put a random float at the cursor in normal mode
local function normal_mode()
    -- Normal mode: Insert random float after the cursor
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    local random_value = string.format("%.2f", random_float())
    vim.api.nvim_buf_set_text(0, line - 1, col, line - 1, col, { random_value })
    vim.api.nvim_win_set_cursor(0, { line, col + #random_value })
end

local function block_select()
    local select_start, select_end
    select_start = vim.api.nvim_buf_get_mark(0, '<')
    select_end = vim.api.nvim_buf_get_mark(0, '>')
    print(select_start, select_end)

end

local function visual_mode(mode)
    -- Visual mode: Replace selected text with random floats
    local start_pos = vim.api.nvim_buf_get_mark(0, "<")
    local end_pos = vim.api.nvim_buf_get_mark(0, ">")
    print(mode)

    -- Handle linewise visual mode
    if mode == "V" then
        start_pos[2] = 0
        end_pos[2] = -1
    end

    -- Handle blockwise visual mode
    if mode == "\22" then
        block_select()
        return
    end

    -- Handle regular visual mode
    local lines = vim.api.nvim_buf_get_lines(0, start_pos[1] - 1, end_pos[1], false)
    local new_lines = {}
    for i, line in ipairs(lines) do
        local new_line = line:sub(1, start_pos[2]) .. string.format("%.2f", random_float()) .. line:sub(end_pos[2] + 1)
        table.insert(new_lines, new_line)
    end
    vim.api.nvim_buf_set_lines(0, start_pos[1] - 1, end_pos[1], false, new_lines)
end

-- Main function to handle insertion or replacement of random floats
function M.insert_random_float()
    local mode = vim.api.nvim_get_mode().mode
    print(mode)

    if mode == "n" then
        normal_mode()
    elseif mode == "v" or mode == "V" or mode == "\22" then
        visual_mode(mode)
    else
        print("Not in normal or visual mode")
    end
end

return M
