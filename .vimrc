execute pathogen#infect()
syntax enable
"fuzzy finder"
set rtp+=~/.fzf
set tabstop=4
set shiftwidth=4
set expandtab
set number
set ruler
    set laststatus=2
set list listchars=tab:»·,trail:·,nbsp:·

"set keys for switiching window focus"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"nerd tree plug in"
map <C-n> :NERDTreeToggle<CR>

set smartcase
set hlsearch

set autoindent

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

"Search and replace selected text with ctrl r
"
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

