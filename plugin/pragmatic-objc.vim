" Author: Ryan Crosby
"
"

let g:pragmatic_objc_bash_script = expand('<sfile>:p:h') . '/../misc/pragmatic-objc.sh'
let g:hello_world_bash_script = expand('<sfile>:p:h') . '/../misc/hello-world.sh'

function! HelloWorld()
    exe "r!" . g:hello_world_bash_script
endfunction

command! HelloWorld call HelloWorld()

function! PragmaticObjCMakeTagsSyntax()
    exe "!" . g:pragmatic_objc_bash_script
endfunction

command! PragmaticObjC call PragmaticObjCMakeTagsSyntax()
