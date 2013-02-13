" Vim syntax file
" Language: Objective-C 2.0
" Maintainer: Ryan Crosby
" Latest Revision: 12 Feb 2013

let b:projsyntaxfname = getcwd() . "/objc-syntax.vim"
let b:globalsyntaxfname = expand("~/.vimtags/syntax")

if filereadable(b:projsyntaxfname) 
    "echo "Loading file at: " . b:projsyntaxfname
    exe 'so ' . b:projsyntaxfname
else
    "echo "Unable to load file at: " . b:projsyntaxfname
end

if filereadable(b:globalsyntaxfname) 
    "echo "Loading file at: " . b:globalsyntaxfname
    exe 'so ' . b:globalsyntaxfname
else
    "echo "Unable to load file at: " . b:globalsyntaxfname
end

hi link objcType Keyword
hi link objcMethod Function

" This is trying at a pattern match for syntax highlighting... looks difficult
" though
" syn keyword cocoaClass NSString

" syn match cocoaClass "\v^\W*([0-9A-Za-z_]+) ?\*"
" syn region cocoaClass start="\v^\s*"hs=e+1 end="(\w+) ?\*"he=e-1

" hi link cocoaClass Special
