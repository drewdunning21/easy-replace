local function getCurs()
    local curs = vim.fn.nvim_win_get_cursor(0)
    return curs[1],curs[2]
end

local function remove(line,row,col,start,finish)
    local newLine = line:sub(0,start) .. line:sub(finish)
    vim.fn.nvim_buf_set_lines(0,row-1,row,false,{newLine})
    vim.fn.nvim_win_set_cursor(0,{row,start})
    vim.fn.nvim_command('star')
end

local function easyReplace()
    local first = vim.g['first']
    local second = vim.g['second']
    local line = vim.fn.nvim_get_current_line()
    local row, col = getCurs()
    local start = nil
    local finish = nil
    for i = col+1, #line do
        local c = line:sub(i,i)
        -- found the start first
        if c == first then
            start = i
            for j = start, #line do
                local b = line:sub(j,j)
                -- found the end
                if b == second then
                    remove(line,row,col,start,j)
                    return
                end
            end

        -- found the end first
        elseif c == second then
            finish = i
            local reversed = string.reverse(line)
            local len = string.len(line)
            for j = len - finish, #line do
                local b = reversed:sub(j,j)
                if b == first then
                    remove(line,row,col,len - j + 1,finish)
                    return
                end
            end
        end
    end
end

-- local function replaceB()

-- end

-- local function replaceC()

-- end

return {
    easyReplace = easyReplace,
}
