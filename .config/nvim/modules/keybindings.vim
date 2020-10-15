" testing inclusiveness (these work)
" nnoremap db dvb
" nnoremap dB dvB
"
noremap n j
noremap e k
noremap j e
noremap gj ge
nnoremap l i
nnoremap i l

"onoremap l something is open for configuration

noremap k n
noremap K N
noremap N J
noremap J E

vnoremap l k

vnoremap e l
vnoremap L I

"fold
noremap ze zk
noremap zn zj
noremap zD zE
noremap z[ [z
noremap z] ]z

"useful
nnoremap Y y$
nnoremap V v$
nnoremap D d$
nnoremap C c$

" noremap gss !python2 -c "import sys; print(sys.stdin.read())"<cr>
"https://stackoverflow.com/questions/40072761/vim-send-visual-block-to-external-command
"added B and S (vis plugin)
"B for applying commands to the visually selected area and only to that visual area
"S is for searching stuff ONLY in the visually selected area
vnoremap <silent> gss :B !sortList.py <cr>t]xT[
vnoremap <silent> gsr :B !sortListR.py <cr>t]xT[


nnoremap gñ :SyntaxQuery<CR>
nnoremap <C-t> :silent call Toggle_transparent()<CR>
function Toggle_transparent()
    exec ":!toggleTrans"
endfunction

" open terminal
map <Leader>st :new term://zsh \| resize 10<CR>

"To map <Esc> to exit terminal-mode:
tnoremap <a-m> <C-\><C-n>

"" Guide navigation
noremap <a-k> <Esc>/<++><Enter>"_c4l
inoremap <a-k> <Esc>/<++><Enter>"_c4l
vnoremap <a-k> <Esc>/<++><Enter>"_c4l

" general insert commands
" inoremap ;g <++>
inoremap <a-m> <++>

" shell
noremap <leader>rb i#!/bin/sh<CR><CR>

" Alias replace all to
nnoremap <A-s> :%s//gI<Left><Left><Left>
" save with no permission using w!!, could be cnoremap
cmap w!! w !sudo tee > /dev/null %

map <leader>rs :!./%<cr>
map <silent> <F11> /\A\zs\a<cr>
noremap <c-n> <c-y>
" noremap  N 5<c-w>-
" noremap  E 5<c-w>+
" noremap  + 5<c-w>>
" noremap  - 5<c-w><
nnoremap <leader>h <c-w>h
nnoremap <leader>n <c-w>j
nnoremap <leader>e <c-w>k
nnoremap <leader>i <c-w>l
nnoremap <leader>ss <c-w>s
nnoremap <leader>sv <c-w>v
" map <leader>i :setlocal autoindent<cr>
" map <leader>I :setlocal noautoindent<cr>
map  <leader>T :w !sudo tee %<CR>
map  <leader>t :w<CR>
map  <leader>q :wq<CR>
map <F6> :e ~/.config/nvim/init.vim<cr>
map <F3> :e ~/.zshrc<cr>
map <C-&> <C-^>
" noremap  <leader>ww :w<CR>
noremap  ! :!
noremap  <F7> :set spell! \| set wrap<CR>

map ñ :

" Ctrl-O lets you do just one command in insert mode

inoremap <C-j> <Left>
inoremap <C-l> <Down>
inoremap <C-u> <Up>
inoremap <C-y> <Right>
cnoremap <C-j> <Left>
cnoremap <C-l> <Down>
cnoremap <C-u> <Up>
cnoremap <C-y> <Right>

map <silent> <leader>rr :call Runner()<cr>
function Runner()
    exec 'silent w'
    let extension = expand('%:e')

    if extension == "c"
         :!gcc %  && ./a.out
    endif

    if extension == "cpp"
         :!g++  % && ./a.out
    endif

    if extension == "py"
        :!python3 %
    endif
    if extension == "js"
        :!node %
    endif
    if extension == ""
        : !chmod +x %; ./%

    endif
endfunction

" open browser in current file folder
map <silent> <leader>ra :silent call jobstart('setsid st -e ranger $(dirname %) 2>&1')<cr>
"old
" map <leader>ra :silent !setsid st -e ranger $(dirname %) 2>&1 &<cr>