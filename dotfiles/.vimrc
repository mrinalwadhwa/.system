set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'vim-erlang/vim-erlang-runtime'
Plugin 'vim-erlang/vim-erlang-compiler'
Plugin 'vim-erlang/vim-erlang-omnicomplete'
Plugin 'vim-erlang/vim-erlang-tags'
Plugin 'chrisbra/csv.vim'
Plugin 'elzr/vim-json'

Plugin 'editorconfig/editorconfig-vim'
Plugin 'altercation/vim-colors-solarized'

Plugin 'rkitover/vimpager'

Plugin 'sjl/vitality.vim'

call vundle#end()

filetype plugin indent on

syntax enable
set background=dark
colorscheme solarized
