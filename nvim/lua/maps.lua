-- vim.g.mapleader = " "
vim.g.mapleader = ","
vim.g.maplocalleader = "<\\>"


local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

-- VIM:
  -- Save
    map("n", "<leader>w", "<CMD>update<CR>")
  -- Quit
    map("n", "<leader>q", "<CMD>q<CR>")
  -- New Windows
    map("n", "<C-c>|", "<CMD>vsplit<CR>")
    map("n", "<C-c>-", "<CMD>split<CR>")
  -- Resize Windows
    map("n", "<S-Left>" , "<C-w>>")
    map("n", "<S-Right>", "<C-w><")
    map("n", "<S-Up>"   , "<C-w>-")
    map("n", "<S-Down>" , "<C-w>+")
  -- Run Code
    map("n", "<leader>c", ":RunCode<CR>")
  -- GDB
    -- map("n", "<leader>g", ":TermExec direction=tab cmd='g++ -g --pedantic -Wall -Werror -std=c++17 -o %:r % ; clear ; gdb %:r ; exit'<CR>")
    vim.cmd([[ autocmd filetype cpp nnoremap <leader>g :TermExec direction=tab cmd='g++ -g --pedantic -Wall -Werror -std=c++20 -o %:r % ; clear ; gdb %:r ; exit'<CR> ]])
    vim.cmd([[ autocmd filetype c nnoremap <leader>g :TermExec direction=tab cmd='gcc -g --pedantic -Wall -Werror -o %:r % ; clear ; gdb %:r ; exit'<CR> ]])
  -- Copy and whatnot
    vim.cmd([[
        " Copy to clipboard
        vnoremap  <C-c>y  "+y
        nnoremap  <C-c>Y  "+yg_
        nnoremap  <C-c>y  "+y
        nnoremap  <C-c>yy  "+yy

        " Paste from clipboard
        nnoremap <C-c>p "+p
        nnoremap <C-c>P "+P
        vnoremap <C-c>p "+p
        vnoremap <C-c>P "+P
    ]])
-- autocmd filetype cpp nnoremap <leader>ac  :w <bar> !g++ -std=c++20 -g -Wall % -o %:r<CR>
-- "" Compile && Run with input
-- autocmd filetype cpp nnoremap <leader>acri :w <bar> !g++ -std=c++20 -Wall -O2 % -o %:r && ./%:r < i<CR>
-- "" Compile && Run
-- autocmd filetype cpp nnoremap <leader>ar  :w <bar> !g++ -std=c++20 -g -Wall % -o %:r && ./%:r<CR>
-- "" Compile && Run debugger
-- function! LaunchGDB()
--     write
--     execute "!g++ -g -std=c++20 % -o %:r"
--     execute "below terminal gdb %:r"
-- endfunction
-- autocmd filetype cpp nnoremap <leader>ard  :call LaunchGDB()<CR>
-- filetype off

  -- Leave Terminal mode
    map("t", '<esc><esc>', [[<C-\><C-n>]])
  -- Buffers
    map("n", "<leader>b", ":buffers<CR>")
    map("n", "<leader>1", ":buffer 1<CR>")
    map("n", "<leader>2", ":buffer 2<CR>")
    map("n", "<leader>3", ":buffer 3<CR>")
    map("n", "<leader>4", ":buffer 4<CR>")
    map("n", "<leader>5", ":buffer 5<CR>")
    map("n", "<leader>6", ":buffer 6<CR>")
    map("n", "<leader>7", ":buffer 7<CR>")
    map("n", "<leader>8", ":buffer 8<CR>")
    map("n", "<leader>9", ":buffer 9<CR>")
    map("n", "<leader>0", ":buffer 10<CR>")
    map("n", "<C-c>0"   , ":BufferClose<CR>")
-- Tabs
    map("n", "<C-tab>"  , ":tabNext<CR>")
    map("n", "<C-c>1"   , ":tabfirst<CR>")
-- Annoying <D-Space> thing
    map("i", "<D-Space>", "")
-- Remove Highlights
    map("n", "<C-c>no", ":nohl<CR>")
-- Disable C-Z suspending nvim
    map("n", "<c-z>", "<nop>")

-- PLUGINS:
-- Plug
    map("n", "<C-c>pi" , ":PlugInstall<CR>")
    map("n", "<C-c>ps" , ":PlugStatus<CR>")
    map("n", "<C-c>pc" , ":PlugClean<CR>")
    map("n", "<C-c>pu" , ":PlugUpdate<CR>")
    map("n", "<C-c>pup", ":PlugUpgrade<CR>")
-- NeoTree
    map("n", "<C-c><C-e>", "<CMD>Neotree toggle<CR>")
    map("n", "<C-c>e"    , "<CMD>Neotree focus<CR>")
-- NeoGit
    map("n", "<C-c>g"    , ":Neogit<CR>")
-- Toggle Term
    map("n", "<C-c>t", "<CMD>ToggleTerm size=6 dir=~/Desktop direction=tab name=desktop<CR>")
  -- Limelight
    map("n", "<C-c>zl", ":Limelight<CR>")
  -- Zenmode
    map("n", "<C-c>zz", ":ZenMode<CR>")
  -- FZF-Lua
    map("n", "<C-c>m" , ":FzfLua<CR>")
    map("n", "<leader>/" , ":FzfLua grep_curbuf<CR>")
    map("n", "<C-c>/" , ":FzfLua live_grep<CR>")
    map("n", "<C-c>b" , ":FzfLua buffers<CR>")
    map("n", "<C-c>f" , ":FzfLua files<CR>")
    map("n", "<C-c>d", ":FzfLua lsp_document_diagnostics<CR>")
    map("n", "<C-c>uc", ":FzfLua colorschemes<CR>")
  -- TODO Comments
    map("n", "<C-c>["  , ":TodoFzfLua<CR>")
  -- Typst PDF preview
    vim.api.nvim_create_user_command("OpenPdf", function()
      local filepath = vim.api.nvim_buf_get_name(0)
      if filepath:match("%.typ$") then
        local pdf_path = filepath:gsub("%.typ$", ".pdf")
        -- os.execute("if [[ $(find pan.typ 2> /dev/null) == "plan.typ" ]]; then echo oi ; else echo uai ; fi")
        -- vim.cmd("!echo oi")
        vim.system({ "Open", pdf_path })
      end
    end, {})
    map("n", "<C-c>tp", "<CMD>OpenPdf<CR>")


-- Unused:
  -- Telescope
-- map("n", "<C-c>b", ":Telescope buffers<CR>")
  -- Transparency Toggle
-- map("n", "<leader>z", ":TransparentToggle<CR>")
  -- Open JABS
-- map("n", "<C-c>j", ":JABSOpen<CR>")
  -- Cheatsheet
-- map("n", "<C-c>h", ":Cheatsheet<CR>")
  -- Table Mode Toggle
-- map("n", "<C-c>m", ":TableModeToggle<CR>")
