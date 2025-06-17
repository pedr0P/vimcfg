local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

-- Rebind of HJKL
vim.cmd [[
noremap m h
noremap n j
noremap e k
noremap i l

noremap h m
noremap j n
noremap k e
noremap l i

noremap M H
noremap N J
noremap E K
noremap I L

noremap H M
noremap J N
noremap K E
noremap L I
]]

-- Window Navigation
map("n", "<A-m>", "<C-w>h")
map("n", "<A-n>", "<C-w>j")
map("n", "<A-e>", "<C-w>k")
map("n", "<A-i>", "<C-w>l")

