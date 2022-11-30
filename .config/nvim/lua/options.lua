local settings = require("settings")
local utils = require("utils")
local opt = vim.opt
local fn = vim.fn

opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50" -- block in normal and beam in insert mode
opt.clipboard = "unnamedplus"
opt.conceallevel = 0
opt.number = settings.number
opt.relativenumber = settings.relative_number
opt.mouse = settings.mouse
opt.showtabline = settings.showtabline
if not settings.disable_winbar then
	o.winbar = "%{%v:lua.require'winbar'.get_winbar()%}"
end
if settings.global_statusline then
	o.laststatus = 3
else
	o.laststatus = 2
end
o.smartcase = true
o.smartindent = true
o.splitbelow = true
o.splitright = true
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.termguicolors = true
o.cursorline = true
o.scrolloff = 5
o.sidescrolloff = 5
o.hlsearch = true
o.ignorecase = true
o.foldenable = false
o.foldcolumn = "1"
o.list = settings.list
o.listchars = settings.listchars
o.shortmess = o.shortmess + "c"
if utils.isNotEmpty(settings.grepprg) then
	o.grepprg = settings.grepprg
end
o.completeopt = { "menu", "menuone", "noselect", "noinsert" }
o.wildignorecase = true
o.wildignore = [[
	.git,.hg,.svn
	*.aux,*.out,*.toc
	*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
	*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
	*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
	*.mp3,*.oga,*.ogg,*.wav,*.flac
	*.eot,*.otf,*.ttf,*.woff
	*.doc,*.pdf,*.cbr,*.cbz,*.odf
	*.zip,*.tar.gz,*.tar.bz2,*.tar.xz,*.kgb
	*.swp,.lock,.DS_Store,._*
	*/tmp/*,*.so,*.swp,*.zip,**/node_modules/**,**/target/**,**.terraform/**"
]]
