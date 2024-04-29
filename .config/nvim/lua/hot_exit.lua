-- File: ~/.config/nvim/lua/hot_exit.lua

local M = {}
local hot_exit_file = vim.fn.expand('~/.backup_files') .. '/hot_exit_state.json'
local default_location = vim.fn.expand('~/.backup_files') .. '/hot_exit_unnamed_buffers/'
local buffer_original_names = {}

local function create_default_location()
    if vim.fn.isdirectory(default_location) == 0 then
        vim.fn.mkdir(default_location, 'p')
    end
end

local function timestamp_pattern_check(filename)
    vim.print("nombre de archivo ".. filename)
    -- Check if filename matches 'unnamed_buffer_YYYYMMDDHHMMSS.txt'
--    if string.match(filename, 'unnamed_buffer_%d%d%d%d%d%d%d%d%d%d%d%d%d.*.txt$') ~= nil then
--    vim.print("cambio de nombre");
--  else
--    vim.print("No cambio de nombre");
--  end

    return string.match(filename, 'unnamed_buffer_%d%d%d%d%d%d%d%d%d%d%d%d.*.txt$') ~= nil
end

local function should_save_buffer(buf)
    local buftype = vim.api.nvim_buf_get_option(buf, 'buftype')
    return buftype == "" and vim.api.nvim_buf_get_name(buf) ~= ""
end

local function save_unnamed_buffer(buf)
    create_default_location()
    local timestamp = os.date('%Y%m%d%H%M%S')
    local filename = default_location .. 'unnamed_buffer_' .. timestamp .. '.txt'
    local contents = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
    local file = io.open(filename, 'w')
    if file then
        for _, line in ipairs(contents) do
            file:write(line, '\n')
        end
        file:close()
        vim.api.nvim_buf_set_name(buf, filename)
        buffer_original_names[buf] = filename
    else
        vim.notify('Failed to save unnamed buffer', vim.log.levels.ERROR)
    end
end

local function handle_file_save(buf)
    local current_name = vim.api.nvim_buf_get_name(buf)
    local original_name = buffer_original_names[buf]
    if original_name and original_name ~= current_name then
        if vim.fn.filereadable(original_name) == 1 then
            vim.fn.delete(original_name)
        end
        buffer_original_names[buf] = nil
    end
    if current_name ~= "" then
        buffer_original_names[buf] = current_name
    end
end

local function remove_file_if_renamed(buf, p_new_name)
    vim.print(buffer_original_names[buf]);
    local new_name = p_new_name
    local old_name = buffer_original_names[buf]
    vim.print("new_name ".. new_name);
    vim.print("old_name ".. old_name);
    if old_name and timestamp_pattern_check(old_name) and new_name ~= old_name and vim.fn.filereadable(old_name) == 1 then
        local confirm = vim.fn.confirm("Buffer renamed. Delete old file?", "&Yes\n&No", 1, "Question")
        if confirm == 1 then
            vim.fn.delete(old_name)
            buffer_original_names[buf] = nil
        end
    end
end

-- Session save/load functions
function M.save_session()
    local buffers = {}
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) then
            local name = vim.api.nvim_buf_get_name(buf)
            local modified = vim.api.nvim_buf_get_option(buf, 'modified')
            local cursor = vim.api.nvim_win_get_cursor(0)
            if name == "" then
                save_unnamed_buffer(buf)
                name = vim.api.nvim_buf_get_name(buf)
            end
            table.insert(buffers, {name = name, contents = modified and vim.api.nvim_buf_get_lines(buf, 0, -1, false) or nil, cursor = cursor, modified = modified})
        end
    end
    local session = {buffers = buffers, active_buffer = vim.api.nvim_get_current_buf()}
    local file = io.open(hot_exit_file, "w")
    if file then
        file:write(vim.json.encode(session))
        file:close()
    else
        vim.notify("Failed to save session", vim.log.levels.ERROR)
    end
end

function M.load_session()
    local file = io.open(hot_exit_file, "r")
    if not file then return end
    local data = file:read("*a")
    file:close()
    vim.print("data ".. data)
    local session = vim.json.decode(data)
    if session.buffers then
        for _, buf in ipairs(session.buffers) do
            vim.cmd('e ' .. buf.name)
            if buf.contents then
                vim.api.nvim_buf_set_lines(0, 0, -1, false, buf.contents)
            end
            --vim.api.nvim_win_set_cursor(0, buf.cursor)
            if buf.modified then
                vim.bo.modified = true
            end
            buffer_original_names[vim.api.nvim_get_current_buf()] = buf.name
        end
    end
    if session.active_buffer then
        vim.print("session.active_buf ".. session.active_buffer)
        vim.api.nvim_set_current_buf(session.active_buffer)
    end
end

vim.api.nvim_create_autocmd("VimLeavePre", {callback = M.save_session})
vim.api.nvim_create_autocmd("VimEnter", {callback = M.load_session})
vim.api.nvim_create_autocmd("BufWritePost", {
    callback = function(args)
        --handle_file_save(args.buf)
        vim.print("BufWritePost")
        vim.print(args.buf)
        vim.print(args)
        remove_file_if_renamed(args.buf, args.match)
    end
})
vim.api.nvim_create_autocmd("BufFilePost", {
    callback = function(args)
        vim.print("BufFilePost")
        remove_file_if_renamed(args.buf, args.match)
    end
})

return M
