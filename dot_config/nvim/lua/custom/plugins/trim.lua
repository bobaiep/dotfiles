local M = {}

M.disable = {"markdown"}

M.patterns = {
    [[%s/\s\+$//e]],
    [[%s/\($\n\s*\)\+\%$//]],
}

return M
